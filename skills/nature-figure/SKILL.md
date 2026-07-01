---
name: nature-figure
description: Create, revise, or audit Nature-style scientific figures for RL, MARL, LLM, and LLM Agent papers. Use for Python/R plotting, training curves, ablations, benchmark bars, architecture diagrams, agent workflow figures, trajectory visualizations, and publication export QA.
version: 2.0.0-agent-rl
---

# AI/RL publication figure workflow

## Blocking gate

If the user asks to generate executable plotting code and has not chosen a backend, ask: **Python or R?** If the user provides Python code or matplotlib context, proceed with Python. For image/design-only requests, focus on figure logic and layout.

## Figure contract

Before drawing, define:

1. core conclusion of the figure;
2. evidence units: seeds, tasks, agents, models, datasets, environments;
3. comparison target: baselines, ablations, scaling, generalization, cost, failure mode;
4. uncertainty display: CI, standard error, bootstrapping, per-seed scatter;
5. export target: PDF/SVG for vector, PNG/TIFF for raster.

## Field-specific figure archetypes

- RL: learning curve with shaded uncertainty, final-return bar with per-seed dots, sample-efficiency curve, hyperparameter sensitivity.
- MARL: partner/opponent generalization matrix, zero-shot coordination heatmap, population diversity map, role/policy trajectory visualization.
- LLM: benchmark grouped bars, scaling/cost Pareto plot, error taxonomy, ablation matrix, prompt sensitivity.
- LLM Agent: workflow graph, tool-call timeline, success/failure trajectory, memory/retrieval diagram, latency-cost-quality Pareto plot.

## Quality rules

- Do not plot mock data unless the user explicitly asks for synthetic illustration.
- Use consistent fonts, readable labels, direct legends, restrained color and high contrast.
- Every multi-panel figure must have a single narrative order.
- State what raw data columns are required if data is missing.
- For RL curves, avoid hiding instability: show seeds or uncertainty.
- For benchmark tables, include rank, mean, uncertainty and compute/cost where relevant.

## Output format

Return: figure plan → required data → code or layout → export instructions → QA checklist.
