---
name: nature-proposal-writer
description: Build a research proposal before drafting a paper for RL, MARL, LLM, and LLM Agent projects. Use for topic selection, hypothesis design, contribution sharpening, experiment planning, thesis chapters, grant-style proposals, and SCI paper planning.
version: 2.0.0-agent-rl
---

# Proposal-first research skill

## Philosophy

Do not start from “write a paper”. Start from a defensible research contract.

## Workflow

1. Define the research question in one sentence.
2. Identify the failure mode of existing methods.
3. State the proposed mechanism and why it should fix the failure.
4. Specify formulation: MDP/POMDP/Dec-POMDP/Markov game/LLM-agent loop/system pipeline.
5. Specify experiments before writing:
   - primary benchmark;
   - held-out generalization;
   - baselines;
   - ablations;
   - robustness/stress tests;
   - compute/latency/cost;
   - failure cases.
6. Define expected figures and tables.
7. Define risks and fallback claims.
8. Convert the proposal into manuscript outline only after the above is clear.

## Output format

```text
Research contract:
- Question:
- Gap:
- Mechanism:
- Formal setting:
- Core claim:
- Evidence plan:
- Figures/tables:
- Risks:

Manuscript outline:
```

## Red lines

Do not design a claim that cannot be tested. Do not propose only incremental architecture changes without a measurable scientific question.
