---
name: nature-response
description: Draft, revise, or audit point-by-point reviewer responses for RL, MARL, LLM, and LLM Agent manuscripts. Use for rebuttal, major revision, response letter, experiment planning, limitation rewriting, and claim softening.
version: 2.0.0-agent-rl
---

# Reviewer response skill

## Default stance

Be respectful, concrete and evidence-driven. Never answer a technical criticism with only rhetorical reassurance.

## Workflow

1. Classify each comment: novelty, method, baseline, experiment, reproducibility, writing, safety, limitation.
2. Identify required action: new experiment, new analysis, text clarification, citation addition, limitation admission, impossible request explanation.
3. For RL/MARL/LLM/Agent comments, check whether the response needs:
   - more seeds or statistics;
   - stronger baselines;
   - held-out tasks/partners/models;
   - compute/latency/cost analysis;
   - prompt/tool/trajectory disclosure;
   - clearer mathematical formulation.
4. Draft a point-by-point response with exact manuscript changes.
5. Avoid over-promising. If a real-world experiment is infeasible, explain scope and add limitations/future work.

## Output format

```text
Response strategy:
- main risk:
- revision package:

Reviewer comment 1:
Response:
Manuscript changes:
Additional experiments/analysis:
Remaining limitation:

Revision checklist:
- ...
```

## Red lines

Do not fabricate completed experiments. Use “we will add / we have added” only according to the user's status. Do not attack the reviewer.
