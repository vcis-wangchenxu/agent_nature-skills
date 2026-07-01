# Reproducibility checklist for RL/MARL/LLM/Agent papers

## Minimum experiment contract

- List environment names, versions, wrappers, observation/action spaces and episode horizons.
- Report number of seeds, seed values or seed-generation rule, confidence intervals or standard errors.
- Separate training tasks/partners/models from test tasks/partners/models when claiming generalization.
- Record total environment steps, wall-clock time, GPU type/count, CPU/RAM and major package versions.
- For RL/MARL: disclose reward shaping, curriculum, replay buffer, rollout length, batch size, learning rate, entropy coefficient, GAE, discount, target-network schedule and evaluation frequency.
- For LLM/Agent: disclose model provider/version/date, decoding parameters, system prompts, tool schemas, memory design, retrieval corpus, execution sandbox, stopping rules and failure handling.

## Baseline fairness

- Compare against strong baselines that address the same problem, not only weak or outdated variants.
- Give every baseline fair tuning budget and report when a baseline implementation is from authors, official code, or reimplementation.
- Include ablations for each claimed module.
- Include compute/latency/cost analysis when the method uses LLMs, retrieval, search, population training or tool execution.

## Artifact readiness

- Provide code or pseudocode sufficient to reproduce the algorithm.
- Provide config files for main experiments.
- Provide raw logs or per-seed results, not only final averaged tables.
- Provide plotting scripts that regenerate figures from saved logs.
- Provide prompts and agent trajectories when conclusions depend on LLM/agent behavior.
