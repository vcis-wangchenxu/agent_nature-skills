---
name: nature-polishing
description: Polish, rewrite, translate, or tighten academic prose for RL, MARL, LLM, and LLM Agent manuscripts. Use for Nature-style English, SCI writing, paragraph flow, terminology consistency, LaTeX expression, and claim-risk reduction.
version: 2.0.0-agent-rl
---

# Field-aware academic polishing

## Core rule

Polishing must improve scientific precision, not merely make prose sound elegant. Preserve technical meaning and reduce unsupported claims.

## Workflow

1. Detect field and section: RL, MARL, LLM, LLM Agent; abstract, introduction, method, experiment, discussion, response.
2. Identify claim strength: descriptive, comparative, causal, theoretical, SOTA, generalization, safety.
3. Normalize terminology:
   - `policy`, `value function`, `trajectory`, `return`, `sample efficiency`, `offline RL`;
   - `centralized training with decentralized execution`, `ad hoc teamwork`, `zero-shot coordination`, `mixed-motive game`;
   - `planner`, `tool schema`, `memory`, `trajectory`, `agent environment`, `prompt`, `retrieval corpus`.
4. Repair paragraph logic: problem → gap → mechanism → evidence → boundary.
5. Replace vague words such as “obviously”, “greatly”, “very good”, “intelligent” with measurable or bounded language.
6. Keep equations, symbols and LaTeX commands intact unless asked to fix them.
7. Provide a modification table when the user asks for explanations.

## Output format

For complete rewrites, return the polished text first. Then provide:

```text
Major changes:
- clarity:
- technical precision:
- claim control:
- grammar/style:
```

## Red lines

Do not add nonexistent experimental results, citations, tasks or theoretical guarantees. Do not turn a weak result into a SOTA claim. Do not erase important limitations.
