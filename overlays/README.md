# agent_nature-skills overlays

This directory contains the field-specific overlay used by `scripts/update-codex-skills.sh` in scheme B.

Default installation now works as follows:

1. Clone the full upstream `Yuan1z0825/nature-skills` repository.
2. Copy the upstream `skills/` directory into a temporary staging tree.
3. Overlay files from this directory into the staging tree.
4. Inject a small hook into each staged `nature-*/SKILL.md`, telling Codex to load `../_shared/agent-domain-extension.md` for RL/MARL/LLM/LLM Agent tasks.
5. Sync the generated full tree into `~/.codex/skills`.

This means the installed Codex skills keep the original upstream `manifest.yaml`, `static/`, `references/`, scripts, templates, and routers, while adding the RL/MARL/LLM/Agent research rules from this repository.

Use `--local-only` only when the machine cannot access GitHub or when you deliberately want the lightweight fallback in `skills/`.
