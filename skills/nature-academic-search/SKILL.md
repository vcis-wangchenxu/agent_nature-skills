---
name: nature-academic-search
description: Search, plan, and organize literature for RL, MARL, LLM, and LLM Agent research. Use for finding papers, building related-work maps, identifying baselines, benchmark provenance, citation gaps, and recent work tracking.
version: 2.0.0-agent-rl
---

# Academic search skill

## Workflow

1. Translate the user's topic into search axes: problem, method, benchmark, baseline, theory, safety.
2. Generate keyword sets for RL/MARL/LLM/Agent variants.
3. Prioritize primary sources: papers, official code, benchmark documentation, venue proceedings.
4. Build a related-work matrix: paper, contribution, method family, benchmark, limitation, relation to user's work.
5. Mark which references are foundational, competing, complementary or cautionary.
6. For recent topics, verify publication dates and versions online when tools are available.

## Output format

```text
Search plan:
Keyword groups:
Must-read papers:
Baseline candidates:
Benchmark/dataset sources:
Related-work matrix:
Open citation gaps:
```

## Red lines

Do not fabricate search results. If live search is unavailable, say that the list is based on supplied material or prior knowledge and needs verification.
