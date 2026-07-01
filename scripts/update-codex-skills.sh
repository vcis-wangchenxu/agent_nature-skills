#!/usr/bin/env bash
# update-codex-skills.sh — install / update full upstream Nature Skills plus RL/MARL/LLM/Agent overlay into Codex.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
LOCAL_SKILLS="$REPO_ROOT/skills"
OVERLAY_SKILLS="$REPO_ROOT/overlays/skills"
DST="${CODEX_SKILLS_DIR:-$HOME/.codex/skills}"
UPSTREAM_REPO="${AGENT_NATURE_UPSTREAM_REPO:-https://github.com/Yuan1z0825/nature-skills.git}"
UPSTREAM_REF="${AGENT_NATURE_UPSTREAM_REF:-main}"
PULL=0
PRUNE=0
CHECK_ONLY=0
LOCAL_ONLY=0
MANIFEST_NAME=".agent-nature-skills-install.txt"

usage() {
  cat <<'USAGE'
update-codex-skills.sh - install full Nature Skills + RL/MARL/LLM/Agent overlay into Codex.

Default behavior, i.e. scheme B:
  1. Clone the full upstream nature-skills repository.
  2. Copy upstream skills/ exactly as the base.
  3. Overlay this repository's RL/MARL/LLM/Agent extension files.
  4. Inject a small hook into each installed SKILL.md so Codex knows to load the field overlay.

Usage:
  scripts/update-codex-skills.sh                 Install full upstream + overlay.
  scripts/update-codex-skills.sh --pull          Run git pull --ff-only for this overlay repo first.
  scripts/update-codex-skills.sh --check         Verify installed skills against generated staging tree.
  scripts/update-codex-skills.sh --prune         Remove stale dirs previously managed by this script.
  scripts/update-codex-skills.sh --dest /path    Override Codex skills destination.
  scripts/update-codex-skills.sh --local-only    Use only this repository's lightweight skills; no upstream clone.

Environment:
  CODEX_SKILLS_DIR=/path                         Default destination override.
  AGENT_NATURE_UPSTREAM_REPO=url                 Override upstream nature-skills repo.
  AGENT_NATURE_UPSTREAM_REF=branch-or-sha        Override upstream ref, default main.
USAGE
}

die() { echo "error: $*" >&2; exit 1; }
need_cmd() { command -v "$1" >/dev/null 2>&1 || die "$1 is required but not installed"; }

while [ "$#" -gt 0 ]; do
  case "$1" in
    --pull) PULL=1 ;;
    --prune) PRUNE=1 ;;
    --check|--verify-only) CHECK_ONLY=1 ;;
    --dest) shift; [ "$#" -gt 0 ] || die "--dest requires a directory"; DST="$1" ;;
    --local-only|--no-upstream) LOCAL_ONLY=1 ;;
    --help|-h) usage; exit 0 ;;
    *) die "unknown argument: $1" ;;
  esac
  shift
done

[ -d "$LOCAL_SKILLS" ] || die "local skills directory not found at $LOCAL_SKILLS"

if [ "$PULL" = "1" ]; then
  if git -C "$REPO_ROOT" rev-parse --git-dir >/dev/null 2>&1; then
    echo "==> Pulling latest overlay repo with git pull --ff-only"
    git -C "$REPO_ROOT" pull --ff-only
  else
    echo "==> Skipping pull: $REPO_ROOT is not a git checkout"
  fi
fi

need_cmd diff
need_cmd git
need_cmd rsync

WORKDIR="$(mktemp -d "${TMPDIR:-/tmp}/agent-nature-install.XXXXXX")"
STAGING="$WORKDIR/staging-skills"
SKILL_LIST="$WORKDIR/skill-list.txt"
DIFF_OUT="$WORKDIR/diff.txt"
trap 'rm -rf "$WORKDIR"' EXIT
mkdir -p "$STAGING"

repo_commit="unknown"
if git -C "$REPO_ROOT" rev-parse --git-dir >/dev/null 2>&1; then
  repo_commit="$(git -C "$REPO_ROOT" rev-parse HEAD)"
fi

build_staging() {
  if [ "$LOCAL_ONLY" = "1" ]; then
    echo "==> Building staging from local lightweight skills"
    rsync -a --delete "$LOCAL_SKILLS/" "$STAGING/"
  else
    echo "==> Cloning full upstream Nature Skills"
    echo "    repo: $UPSTREAM_REPO"
    echo "    ref:  $UPSTREAM_REF"
    git clone --depth=1 --branch "$UPSTREAM_REF" "$UPSTREAM_REPO" "$WORKDIR/upstream" >/dev/null 2>&1 || \
      die "failed to clone upstream nature-skills. Check network access or use --local-only."
    [ -d "$WORKDIR/upstream/skills" ] || die "upstream repository does not contain skills/"
    rsync -a --delete "$WORKDIR/upstream/skills/" "$STAGING/"
  fi

  if [ -d "$OVERLAY_SKILLS" ]; then
    echo "==> Applying RL/MARL/LLM/Agent overlay files"
    rsync -a "$OVERLAY_SKILLS/" "$STAGING/"
  fi

  inject_agent_hook

  : > "$SKILL_LIST"
  for path in "$STAGING"/*/; do
    [ -d "$path" ] || continue
    name="$(basename "$path")"
    if [ "$name" != "_shared" ] && [ ! -f "$path/SKILL.md" ]; then
      die "unexpected staged $name directory without SKILL.md"
    fi
    printf '%s\n' "$name" >> "$SKILL_LIST"
  done
  sort -o "$SKILL_LIST" "$SKILL_LIST"
  [ -s "$SKILL_LIST" ] || die "no skill directories found in staging"
}

inject_agent_hook() {
  local hook_marker="agent_nature-skills field overlay hook"
  local hook_text
  hook_text='\n\n## agent_nature-skills field overlay hook\n\nWhen the user task is about reinforcement learning, multi-agent reinforcement learning, large language models, or LLM agents, also load and apply `../_shared/agent-domain-extension.md` after the original Nature-skill rules. Preserve the upstream skill workflow, router protocol, manifest/static/reference loading order, and safety rules; the agent-domain extension only adds field-specific checks for RL/MARL/LLM/Agent claims, experiments, figures, citations, reproducibility, and reviewer-risk control.\n'

  for skill_file in "$STAGING"/nature-*/SKILL.md; do
    [ -f "$skill_file" ] || continue
    if ! grep -q "$hook_marker" "$skill_file"; then
      printf "%b" "$hook_text" >> "$skill_file"
    fi
  done
}

verify_install() {
  status=0
  while IFS= read -r name; do
    src_path="$STAGING/$name"
    dst_path="$DST/$name"
    if [ ! -d "$dst_path" ]; then
      echo "MISSING  $name"
      status=1
    elif diff -qr "$src_path" "$dst_path" >"$DIFF_OUT"; then
      echo "MATCH    $name"
    else
      echo "DIFF     $name"
      sed 's/^/         /' "$DIFF_OUT"
      status=1
    fi
  done < "$SKILL_LIST"
  return "$status"
}

build_staging

if [ "$CHECK_ONLY" = "1" ]; then
  echo "==> Verifying Codex skills in $DST"
  verify_install
  echo "==> Verified against overlay commit $repo_commit"
  exit 0
fi

mkdir -p "$DST"
echo "==> Syncing generated full skills tree into $DST"
while IFS= read -r name; do
  mkdir -p "$DST/$name"
  rsync -a --delete "$STAGING/$name/" "$DST/$name/"
  echo "    synced $name"
done < "$SKILL_LIST"

manifest="$DST/$MANIFEST_NAME"
if [ "$PRUNE" = "1" ] && [ -f "$manifest" ]; then
  echo "==> Pruning stale directories previously managed by this script"
  while IFS= read -r old_name; do
    case "$old_name" in ""|\#*) continue ;; esac
    if ! grep -Fxq "$old_name" "$SKILL_LIST" && [ -d "$DST/$old_name" ]; then
      rm -rf "$DST/$old_name"
      echo "    pruned $old_name"
    fi
  done < "$manifest"
fi

{
  echo "# Managed by agent_nature-skills scripts/update-codex-skills.sh"
  echo "# mode=$([ "$LOCAL_ONLY" = "1" ] && echo local-only || echo full-upstream-plus-agent-overlay)"
  echo "# overlay_source=$REPO_ROOT"
  echo "# overlay_commit=$repo_commit"
  echo "# upstream_repo=$UPSTREAM_REPO"
  echo "# upstream_ref=$UPSTREAM_REF"
  date '+# updated_at=%Y-%m-%dT%H:%M:%S%z'
  cat "$SKILL_LIST"
} > "$manifest"

echo "==> Verifying copied skills"
verify_install

echo "==> Done. Installed full upstream Nature Skills plus RL/MARL/LLM/Agent overlay."
