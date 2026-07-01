# agent_nature-skills

面向 **RL / MARL / LLM / LLM Agent** 方向的 Nature-style 科研技能库。

本仓库现在采用 **完整原版 nature-skills + 领域增强 overlay**。

也就是说，它不再只是轻量版 `README.md + SKILL.md`，而是在安装时先拉取原始 `Yuan1z0825/nature-skills` 的完整文件树，再叠加本仓库的 RL/MARL/LLM/LLM Agent 规则。这样可以保留原始仓库的 `manifest.yaml`、`static/`、`references/`、脚本、模板和复杂 router 能力，同时让 Codex 在处理你的研究方向时自动加载领域增强规则。

## 适用场景

- Nature / Nature Machine Intelligence / Nature Communications / Science / Cell / NeurIPS / ICML / ICLR / AAAI 等高水平投稿前准备。
- RL、Offline RL、RLHF/RLAIF、MARL、Ad Hoc Teamwork、Zero-Shot Coordination、LLM Agent、Tool-use Agent、Multi-agent LLM、Agent Safety、Agent Evaluation 等论文写作与审查。
- 论文从选题、文献检索、方法叙述、实验设计、科研绘图、审稿模拟、response letter、数据与代码可用性声明到汇报 PPT 的全流程辅助。

## 工作方式

运行：

```bash
scripts/update-codex-skills.sh --pull
```

脚本会执行以下流程：

```text
1. 更新当前 agent_nature-skills 仓库
2. clone 原始完整 nature-skills 仓库
3. 将原始仓库的 skills/ 复制到临时 staging 目录
4. 将本仓库 overlays/skills/ 中的 RL/MARL/LLM/Agent 增强规则叠加进去
5. 在每个 nature-*/SKILL.md 末尾注入一个 field overlay hook
6. 将生成后的完整 skills tree 同步到 ~/.codex/skills
7. 运行 diff 验证安装结果
```

这样本地 Codex 实际使用的是：

```text
原版完整 nature-skills
+ manifest.yaml / static / references / scripts / templates
+ agent_nature-skills 的 RL/MARL/LLM/Agent 领域增强规则
```

## 目录说明

```text
scripts/update-codex-skills.sh       # 安装脚本，默认 full upstream + overlay
overlays/                            # 领域增强 overlay，安装时叠加到原版 nature-skills
  skills/_shared/agent-domain-extension.md
skills/                              # 轻量 fallback；仅在 --local-only 时使用
```

注意：`skills/` 目录仍然保留，是为了在无法访问 GitHub 或你明确使用 `--local-only` 时提供轻量 fallback。正常使用请走默认方案 B。

## Mac 本地安装

第一次安装：

```bash
git clone https://github.com/vcis-wangchenxu/agent_nature-skills.git
cd agent_nature-skills
chmod +x scripts/update-codex-skills.sh
scripts/update-codex-skills.sh --pull
scripts/update-codex-skills.sh --check
```

以后更新：

```bash
cd agent_nature-skills
scripts/update-codex-skills.sh --pull
scripts/update-codex-skills.sh --check
```

如果你的网络无法访问 GitHub 上游仓库，可以临时使用轻量 fallback：

```bash
scripts/update-codex-skills.sh --local-only
```

会保留原始 nature-skills 的完整能力。

## 安装位置

默认安装到：

```bash
~/.codex/skills
```

安装后重新打开一个新的 Codex 会话，然后可以这样触发：

```text
$nature-writing 帮我根据这个 MARL 方法起草 Nature Machine Intelligence 风格的 Introduction。
$nature-reviewer 从 Nature Machine Intelligence 审稿人角度审查这篇 LLM Agent 论文。
$nature-figure 用 Python 给我生成符合 Nature 风格的 RL 训练曲线和消融图。
$nature-response 根据这三条审稿意见帮我写逐点回复。
```

## 领域增强覆盖的重点

1. **RL**：MDP/POMDP、reward shaping、sample efficiency、seed/CI、offline/online leakage、evaluation protocol。
2. **MARL**：Dec-POMDP/Markov game、CTDE、zero-shot coordination、unknown teammates/opponents、ad hoc teamwork、partner generalization。
3. **LLM**：model version、prompt、decoding、benchmark contamination、baseline freshness、alignment/RLHF/RLAIF。
4. **LLM Agent**：planner、memory、tool schema、trajectory logging、environment interaction、latency/cost、safety boundary。

## 技能索引

安装完成后，本地 Codex 会拥有原版完整 `nature-skills` 的所有技能，并额外加载本仓库的领域增强规则：

| Skill | 主要用途 |
|---|---|
| `nature-writing` | RL/MARL/LLM/Agent 论文选题、摘要、引言、方法、实验、讨论写作 |
| `nature-polishing` | 学术英语润色、中文转英文、claim 风险控制、LaTeX 表达修正 |
| `nature-figure` | RL 曲线、benchmark 表、消融图、agent 架构图、trajectory 图 |
| `nature-reviewer` | 模拟三位审稿人，从 novelty、rigor、reproducibility、significance 评审 |
| `nature-response` | 审稿意见回复、补实验规划、rebuttal 风险控制 |
| `nature-citation` | RL/MARL/LLM/Agent 文献证据链、引用核验、相关工作矩阵 |
| `nature-data` | 数据、代码、模型、prompt、日志、轨迹、environment 的可用性声明 |
| `nature-reader` | 精读论文，提取问题、方法、实验、局限、可复现要点 |
| `nature-paper2ppt` | 从论文生成中文/英文科研汇报 PPT 大纲与讲稿 |
| `nature-paper-to-patent` | 从算法/系统论文提炼可专利化技术方案，不替代法律意见 |
| `nature-academic-search` | 文献检索、证据图谱、benchmark/基线追踪 |
| `nature-downloader` | 合法获取论文全文、整理 PDF 与 BibTeX |
| `nature-literature-pipeline` | 建立 RL/LLM Agent 每日/每周文献跟踪管线 |
| `nature-proposal-writer` | 先建立 research proposal，再写论文，适合博士课题和 SCI 选题 |

## 许可证

Apache-2.0。
