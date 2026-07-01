# RL / MARL / LLM / LLM Agent field taxonomy

## Paper families

1. **RL algorithm paper**: new objective, exploration strategy, policy/value architecture, offline RL method, model-based RL, RLHF/RLAIF, reward modeling, sample efficiency, safety-constrained RL.
2. **MARL paper**: cooperative, competitive, mixed-motive, ad hoc teamwork, zero-shot coordination, CTDE, opponent modeling, population-based training, emergent communication.
3. **LLM paper**: foundation model method, alignment, reasoning, retrieval, tool use, evaluation, efficient fine-tuning, hallucination mitigation.
4. **LLM Agent paper**: planner-executor-memory-tool loop, multi-agent debate/collaboration, workflow automation, environment interaction, benchmark design, agent safety.
5. **System / benchmark paper**: reproducible platform, new benchmark, simulator, evaluation protocol, dataset, logging or analysis toolkit.

## Contribution types

Always classify the manuscript's contribution before writing or reviewing:

- **Algorithmic**: new update rule, loss, training procedure, search/planning mechanism, agent coordination mechanism.
- **Architectural**: new model, memory, module, role decomposition, policy ensemble, communication protocol.
- **Evaluation**: new benchmark, task suite, stress test, protocol, metric or reproducibility standard.
- **Theoretical**: convergence, regret, generalization, sample complexity, equilibrium, PAC-Bayes, causal or information-theoretic bound.
- **Empirical insight**: systematic finding about scaling, transfer, failure modes or behavior.

## Red-flag claims

Flag these claims unless supported by direct evidence:

- “generalizes” without held-out tasks, held-out partners, held-out models, or distribution shift.
- “robust” without adversarial/noisy/long-horizon/stochastic stress tests.
- “state-of-the-art” without fresh, strong, fairly tuned baselines.
- “agentic intelligence” without environment interaction, tool-use contract, memory state and failure analysis.
- “multi-agent collaboration” when all agents are centrally scripted or evaluated only with training partners.
