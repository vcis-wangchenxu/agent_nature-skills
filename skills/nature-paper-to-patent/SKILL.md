---
name: nature-paper-to-patent
description: Convert RL, MARL, LLM, or LLM Agent research into a preliminary technical invention disclosure or Chinese patent-style draft. Use for invention points, claims, embodiments, flowcharts, and technical effects. Not legal advice.
version: 2.0.0-agent-rl
---

# Paper-to-patent technical extraction

## Scope

This skill helps draft technical invention material. It does not provide legal advice or guarantee patentability.

## Workflow

1. Extract the technical problem, system components, algorithmic steps and technical effect.
2. Identify patentable candidates: training pipeline, inference workflow, agent memory/tool system, multi-agent coordination mechanism, benchmark automation, safety guard.
3. Separate scientific claims from engineering implementation.
4. Draft independent and dependent claim candidates in plain technical language.
5. Provide embodiments and flowchart description.
6. Flag prior-art and enablement risks.

## Output format

```text
Technical invention summary:
Potential invention points:
Claim candidate 1:
Dependent claim candidates:
Embodiments:
Technical effects:
Prior-art / enablement risks:
```

## Red lines

Do not claim legal validity. Do not invent implementation details absent from the paper unless clearly labeled as proposed embodiments.
