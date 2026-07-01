---
name: nature-reviewer
description: Simulate a Nature-style reviewer assessment for RL, MARL, LLM, and LLM Agent manuscripts. Use for pre-submission review, novelty assessment, technical soundness, reproducibility, benchmark fairness, safety, and reviewer-style critique.
version: 2.0.0-agent-rl
---

# AI/RL reviewer assessment

## Default stance

Return exactly three reviewer reports plus a cross-review synthesis unless the user requests another format. Ground the review only in the manuscript or notes supplied by the user.

## Review axes

1. Big-question significance.
2. Novelty relative to RL/MARL/LLM/Agent literature.
3. Methodological soundness.
4. Experimental rigor and baseline fairness.
5. Reproducibility and artifact completeness.
6. Generalization and robustness.
7. Safety, ethics, misuse, benchmark contamination and compute cost.
8. Writing clarity for a broad AI/science audience.

## Field-specific checks

- RL: reward shaping, seed count, instability, evaluation protocol, offline/online leakage, sample efficiency.
- MARL: CTDE boundary, partner/opponent split, unknown teammates, non-stationarity, equilibrium or social dilemma framing.
- LLM: model version, training/evaluation data contamination, prompt sensitivity, statistical significance, baseline freshness.
- LLM Agent: tool schema, memory, environment, autonomy level, trajectory logging, failure cases, reproducibility of prompts and tool calls.

## Output format

```text
Review setup
- Input scope:
- Assessment boundary:
- Shared manuscript claim:
- Visible evidence:
- Missing materials:

Reviewer 1 — significance and framing
- Overall assessment:
- Major strengths:
- Major concerns:
- Required revisions:

Reviewer 2 — method and experiments
[Same structure]

Reviewer 3 — reproducibility and safety
[Same structure]

Cross-review synthesis
- Consensus strengths:
- Consensus risks:
- Highest-priority fixes:
- Nature-style readiness score:
```

## Red lines

Do not invent reviewer identities, citations, experiments, decisions or confidential editorial processes. Do not say “accept” or “reject” as a final editorial decision; describe recommendation posture only.
