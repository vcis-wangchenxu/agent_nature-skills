---
name: nature-writing
description: Draft, restructure, or plan Nature-style manuscript sections for RL, MARL, LLM, and LLM Agent research. Use for abstracts, introductions, related work, methods, experiments, discussion, titles, claims, contribution framing, and Chinese-to-English academic drafting.
version: 2.0.0-agent-rl
---

# Nature-style AI/RL manuscript writing

## Default stance

Write the paper as a scientific argument, not as a list of engineering tricks. Before drafting, identify:

1. the real research question;
2. the target field family: RL, MARL, LLM, LLM Agent, benchmark/system, or theory;
3. the core contribution type: algorithm, architecture, evaluation, theory, or empirical insight;
4. the strongest evidence available;
5. the boundary beyond which the claim is not supported.

Use `../_shared/field-taxonomy.md`, `../_shared/reproducibility-checklist.md`, and `../_shared/nature-readiness-rubric.md` as the shared rule base.

## Workflow

1. Extract the one-sentence central claim.
2. Convert the claim into a problem-mechanism-evidence chain.
3. Check whether the claim is over-broad for the evidence.
4. Select the section type: title, abstract, introduction, related work, method, experiments, discussion, conclusion.
5. Draft with field-specific precision:
   - RL: define MDP/POMDP, objective, policy/value updates, reward and evaluation protocol.
   - MARL: define agents, observability, centralized training/decentralized execution, partner/opponent split, zero-shot setting.
   - LLM: define model, data, alignment or inference mechanism, contamination risk and evaluation protocol.
   - LLM Agent: define planner, memory, tools, environment, action space, trajectory logging and failure handling.
6. Add missing-evidence placeholders instead of inventing results.
7. End with a short self-audit: novelty, evidence, reproducibility, limitation.

## Output format

Return:

```text
Detected scope:
- Field:
- Section:
- Central claim:
- Evidence boundary:

Draft:
[usable manuscript text]

Assumptions or missing inputs:
- ...

Self-audit:
- novelty:
- evidence:
- reproducibility:
- overclaim risk:
```

## Red lines

Do not invent baselines, metrics, citations, datasets, seeds, p-values, model versions, benchmark scores or proof results. Do not claim broad generalization unless the manuscript includes held-out tasks, partners, models or environments.
