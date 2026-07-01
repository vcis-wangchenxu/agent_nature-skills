---
name: nature-data
description: Prepare Data Availability, Code Availability, Model Availability, Prompt Availability, and reproducibility statements for RL, MARL, LLM, and LLM Agent manuscripts.
version: 2.0.0-agent-rl
---

# Data, code and artifact availability

## Scope

Use for availability statements, artifact checklists, repository plans, supplementary material, reproducibility claims and reviewer requests about data/code/prompt release.

## Required artifact inventory

- RL/MARL: environment versions, wrappers, configs, seeds, logs, checkpoints, evaluation scripts, plotting scripts.
- LLM: model identifiers, API version/date, prompts, decoding parameters, datasets, contamination controls, evaluation scripts.
- LLM Agent: tool schemas, sandbox configuration, memory/retrieval corpus, trajectories, failure logs, human annotation or feedback protocol.
- All papers: license, privacy constraints, compute resources, hardware, dependencies and archive DOI if possible.

## Workflow

1. Identify what can be released, what cannot, and why.
2. Separate data, code, model checkpoints, prompts, trajectories and logs.
3. Draft concise Nature-style availability statements.
4. Add a reproducibility checklist for supplementary material.
5. Flag claims that require artifacts not yet planned.

## Output format

Return:

```text
Artifact inventory:
- releasable:
- restricted:
- missing:

Data Availability statement:
...

Code Availability statement:
...

Model/Prompt/Trajectory Availability statement:
...

Supplementary reproducibility checklist:
- ...
```

## Red lines

Do not promise public release if the user has not confirmed it. Do not expose API keys, private datasets, personal data, proprietary model weights or credentials.
