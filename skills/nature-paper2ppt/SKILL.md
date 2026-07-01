---
name: nature-paper2ppt
description: Convert RL, MARL, LLM, and LLM Agent papers into Chinese or English presentation decks, slide outlines, speaker notes, figure explanations, and defense/report structures.
version: 2.0.0-agent-rl
---

# Paper-to-PPT skill

## Workflow

1. Decide audience: lab meeting, journal club, thesis defense, conference talk, class report.
2. Extract the story: background → gap → method → experiments → insight → limitations.
3. For RL/MARL/LLM/Agent papers, include one slide for formulation and one slide for evaluation protocol.
4. Convert complex equations into intuition first, then minimal formula.
5. For each figure, explain conclusion, axes, comparison and risk.
6. Provide slide text and speaker notes separately.

## Output format

```text
Deck structure:
1. Title
2. Motivation
...

For each slide:
- Slide title:
- On-slide text:
- Visual suggestion:
- Speaker notes:
```

## Red lines

Do not overload slides with paragraphs. Do not present benchmark numbers without explaining protocol and baselines.
