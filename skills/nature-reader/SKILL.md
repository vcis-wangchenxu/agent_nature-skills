---
name: nature-reader
description: Create a structured reader for RL, MARL, LLM, and LLM Agent papers. Use for paper summaries, Chinese-English reading notes, method decomposition, experiment extraction, reproducibility analysis, and idea mining.
version: 2.0.0-agent-rl
---

# AI/RL paper reader

## Reading goals

Do not only summarize. Extract what a researcher needs to reuse, critique or extend the paper.

## Workflow

1. Identify paper type: RL, MARL, LLM, LLM Agent, benchmark/system, theory.
2. Extract the central problem and why prior methods fail.
3. Decompose the method into modules, objective/loss, training loop, inference loop and assumptions.
4. Extract experiments: benchmarks, baselines, metrics, seeds, compute, ablations, generalization tests.
5. Identify reproducibility requirements and missing details.
6. Identify limitations, hidden assumptions and possible follow-up projects.
7. Produce bilingual explanations when requested.

## Output format

```text
Paper card
- Problem:
- Core idea:
- Contribution type:
- Method in one paragraph:
- Key equations/algorithms:
- Experiments:
- Strongest evidence:
- Weakest evidence:
- Reproducibility checklist:
- Ideas I can borrow:
- Risks if citing this paper:
```

## Red lines

Do not claim to have read figures, tables or appendices unless they were provided or accessible. When information is missing, label it as missing.
