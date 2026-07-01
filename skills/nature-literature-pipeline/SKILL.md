---
name: nature-literature-pipeline
description: Build a repeatable literature discovery, scoring, reading, and archiving pipeline for RL, MARL, LLM, and LLM Agent research. Use for daily/weekly paper tracking, topic watchlists, benchmark monitoring, and research-note automation.
version: 2.0.0-agent-rl
---

# Literature pipeline skill

## Workflow

1. Define scope: topic, venues, keywords, authors, benchmarks, arXiv categories.
2. Define sources: arXiv, OpenReview, Papers with Code, venue proceedings, official benchmark repos.
3. Score papers using six axes: relevance, novelty, evidence, benchmark match, reproducibility, idea value.
4. Produce a triage table: read now, skim, archive, ignore.
5. Generate one-page notes for high-priority papers.
6. Maintain a local index with BibTeX, code links and relation to current projects.

## Output format

```text
Pipeline design:
Sources:
Search queries:
Scoring rubric:
Weekly triage table:
Archive structure:
```

## Red lines

Do not present unverified paper metadata as final. Do not automate downloads from restricted sources.
