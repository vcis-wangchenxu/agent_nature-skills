# RL / MARL / LLM / LLM Agent domain extension

This file is loaded in addition to the upstream Nature skill rules when the user task is about reinforcement learning, multi-agent reinforcement learning, large language models, or LLM agents. It is an overlay, not a replacement: preserve the original Nature workflow, router protocol, manifest/static/reference loading order, and non-invention rules.

## 1. Field taxonomy

Classify the manuscript or task before writing, reviewing, plotting, citing, or responding.

### RL

Typical topics: online RL, offline RL, model-based RL, imitation learning, inverse RL, safe RL, constrained RL, exploration, sample efficiency, reward learning, RLHF, RLAIF, policy optimization, value learning, planning, world models.

Minimum formulation expected in serious manuscripts:

- MDP or POMDP definition;
- state, observation, action, reward, transition and horizon;
- objective, return and discount;
- policy/value parameterization;
- training and evaluation protocol;
- environment versions, wrappers and random seeds.

### MARL

Typical topics: cooperative MARL, competitive MARL, mixed-motive games, CTDE, decentralized execution, ad hoc teamwork, zero-shot coordination, opponent modeling, teammate modeling, emergent communication, population-based training, self-play, fictitious play, league training.

Minimum formulation expected:

- Markov game, Dec-POMDP, partially observable stochastic game, or equivalent formalization;
- controlled agents versus external partners/opponents;
- joint action, local observation, reward structure and communication assumptions;
- training teammate/opponent pool versus held-out evaluation entities;
- CTDE boundary and decentralized execution condition;
- social welfare, individual return, exploitability, regret, cooperation rate or task-specific metrics.

### LLM

Typical topics: reasoning, retrieval-augmented generation, tool use, fine-tuning, alignment, RLHF/RLAIF, hallucination mitigation, safety, evaluation, efficient inference, multimodal LLMs.

Minimum evidence expected:

- model name, provider, version/date, size or family when available;
- prompt or instruction template;
- decoding parameters;
- dataset and benchmark provenance;
- contamination and leakage controls;
- baseline model and method versions;
- statistical treatment across samples, prompts or random seeds when applicable.

### LLM Agent

Typical topics: planning agents, tool-use agents, workflow agents, memory agents, multi-agent debate/collaboration, autonomous web or code agents, benchmark environments, agent safety.

Minimum system contract expected:

- planner/controller structure;
- tool schemas and permissions;
- memory state, retrieval corpus and update rule;
- environment interface and action space;
- stopping rule and failure handling;
- trajectory logging;
- cost, latency, token usage and tool-call statistics;
- safety boundaries and sandbox assumptions.

## 2. Contribution classification

Before drafting or reviewing, label the contribution as one or more of:

- **Algorithmic**: new loss, update rule, training loop, exploration mechanism, policy generation, planning/search, reward or value estimation.
- **Architectural**: new policy network, memory module, role decomposition, MoE, hypernetwork, retrieval module, multi-agent communication structure, planner-tool-memory graph.
- **Benchmark/evaluation**: new environment, task suite, protocol, metric, stress test, logging standard or evaluation harness.
- **Theoretical**: convergence, regret, sample complexity, generalization bound, equilibrium property, PAC-Bayes bound, causal or information-theoretic analysis.
- **Empirical insight**: systematic discovery about scaling, transfer, failure modes, cooperation/competition, cost-quality trade-offs, safety boundaries.
- **System artifact**: framework, simulator, data pipeline, agent platform, reproducibility toolkit.

A Nature-style claim usually needs more than a local performance gain. It should connect the technical mechanism to a broader scientific or technological question.

## 3. Claim-risk control

Flag or soften these claims unless directly supported.

| Claim | Required evidence |
|---|---|
| generalization | held-out tasks, held-out partners/opponents, held-out models, OOD environments, or distribution shift |
| robustness | adversarial, noisy, stochastic, long-horizon, partial-observation or failure-case stress tests |
| SOTA | strong, recent, fairly tuned baselines with identical evaluation budgets |
| sample efficiency | return versus environment steps, not only final score |
| agentic intelligence | real environment interaction, tool contract, memory state, trajectory evidence and failure analysis |
| multi-agent collaboration | decentralized execution or nontrivial coordination evidence, not only centralized scripted cooperation |
| safety | explicit hazard model, guardrail evaluation, misuse analysis and boundary of autonomy |
| interpretability | faithful analysis, not only post-hoc visualization |
| human alignment | human preference source, annotation protocol, evaluator reliability and bias discussion |

Use bounded language when evidence is partial: “in the evaluated tasks”, “under the tested partner distributions”, “for the model families considered”, “within this simulator”.

## 4. Reproducibility checklist

### RL / MARL

Require or ask for:

- environment name and version;
- wrappers, reward shaping and observation preprocessing;
- train/test task split;
- train/test partner or opponent split for MARL;
- number of seeds and seed handling;
- total environment steps and evaluation frequency;
- hyperparameters: learning rate, batch size, rollout length, discount, entropy coefficient, GAE, target update, replay buffer, population size;
- hardware and wall-clock time;
- checkpoint selection rule;
- raw logs and plotting scripts;
- ablations for every claimed module.

### LLM / LLM Agent

Require or ask for:

- model identifier and version/date;
- system prompt, user prompt template and any hidden prompts that materially affect behavior;
- decoding parameters;
- retrieval corpus and index build procedure;
- tool schema, permissions and sandbox;
- memory read/write/update rule;
- execution horizon, stopping criteria and retry policy;
- cost, latency, token usage and tool-call statistics;
- benchmark contamination checks;
- released trajectories or representative traces.

## 5. Experimental design expectations

### Strong baselines

For RL/MARL papers, compare against algorithms that solve the same problem family, not only generic PPO/MAPPO. For LLM Agent papers, compare against strong prompting, planning, retrieval and agent frameworks, not only direct LLM answering.

### Ablations

Every named module requires an ablation. For MARL/agent systems, include ablations for:

- memory/retrieval;
- role or intention modeling;
- population diversity;
- planner/tool decomposition;
- communication channel;
- curriculum;
- LLM-generated component;
- safety filter or verifier.

### Generalization tests

Prefer matrices over single scores:

- train environments × test environments;
- train partners × unseen partners;
- seen models × unseen models;
- clean tasks × noisy/adversarial tasks;
- short horizon × long horizon;
- single-agent × multi-agent variants.

### Statistical reporting

Use per-seed curves, confidence intervals, standard errors or bootstrap intervals. Avoid presenting only the best seed or a single final score.

## 6. Figure-specific guidance

Use the upstream `nature-figure` rules first. Add these field-specific expectations:

- RL learning curves: x-axis should be environment steps or episodes; show mean and uncertainty; use the same smoothing rule across methods; do not hide unstable seeds.
- MARL generalization: use heatmaps or matrices for training partners/tasks versus unseen partners/tasks.
- Agent workflows: show planner, memory, tools, environment, verifier and feedback loops; label what is learned, prompted, retrieved or executed.
- Cost-quality plots: for LLM/agent methods, report quality versus tokens, cost, latency or tool calls.
- Ablation figures: align bars or curves with named modules in the method section.

## 7. Reviewer simulation guidance

When simulating reviewers for these fields, distribute emphasis as follows unless the user requests otherwise:

- Reviewer 1: significance, novelty and broad-interest framing.
- Reviewer 2: method, formalization, baselines and experiments.
- Reviewer 3: reproducibility, safety, compute cost and limitations.

Common major concerns:

- unclear formal setting;
- weak or outdated baselines;
- missing held-out generalization;
- insufficient seeds/statistics;
- opaque LLM prompts or tool schemas;
- benchmark leakage or contamination;
- overclaiming from simulator-only evidence;
- no failure analysis;
- excessive compute or latency without analysis.

## 8. Response-letter guidance

For reviewer responses:

1. Acknowledge the technical substance of the concern.
2. State the concrete revision: new experiment, new ablation, added details, claim softening, new limitation, new citation or new appendix.
3. For infeasible real-world validation, explain the paper's theoretical or simulation scope, add stress tests, discuss deployment risks and write a limitation honestly.
4. Do not claim a new experiment has been completed unless the user provides results.
5. If adding text, specify the section and the exact conceptual change.

## 9. Writing guidance

For Nature-style AI/RL writing:

- Start with the scientific bottleneck, not the algorithm name.
- Explain why existing paradigms fail under the target setting.
- Introduce the method as a mechanism that addresses the bottleneck.
- Present evidence as a hierarchy: core task → generalization → ablation → stress test → cost/failure analysis.
- End discussion with boundaries: simulator, model family, compute, safety, data and deployment assumptions.

Avoid phrases that sound broad but untestable: “human-like intelligence”, “universal agent”, “solves cooperation”, “fully robust”, “guarantees alignment”.

## 10. Minimum readiness rubric

Score the manuscript from 0 to 5 on each axis:

1. Big-question fit.
2. Contribution clarity.
3. Evidence strength.
4. Generalization.
5. Mechanistic insight.
6. Reproducibility.
7. Writing accessibility.
8. Safety and limitation handling.

Interpretation:

- 0–15: internal draft.
- 16–25: early workshop or weak conference draft.
- 26–32: plausible conference submission after revision.
- 33–40: plausible high-impact submission if the novelty is truly strong.

Always explain which evidence would most efficiently raise the score.
