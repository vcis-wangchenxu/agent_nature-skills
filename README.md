# agent_nature-skills

面向 **RL / MARL / LLM / LLM Agent** 方向的 Nature-style 科研技能库。本仓库基于 `nature-skills` 的可复用目录思想重构：保留原始安装级结构和 14 个 `nature-*` 技能入口，但将规则、检查项、输出格式和审稿风险全部改造成强化学习、多智能体强化学习、大语言模型和智能体系统论文场景。

## 适用场景

- Nature / Nature Machine Intelligence / Nature Communications / Science / Cell / NeurIPS / ICML / ICLR / AAAI 等高水平投稿前准备。
- RL、Offline RL、RLHF/RLAIF、MARL、Ad Hoc Teamwork、Zero-Shot Coordination、LLM Agent、Tool-use Agent、Multi-agent LLM、Agent Safety、Agent Evaluation 等论文写作与审查。
- 论文从选题、文献检索、方法叙述、实验设计、科研绘图、审稿模拟、response letter、数据与代码可用性声明到汇报 PPT 的全流程辅助。

## 与原版 nature-skills 的关系

本仓库保留原仓库的安装习惯：

```text
scripts/update-codex-skills.sh
skills/_shared/
skills/nature-figure/
skills/nature-polishing/
skills/nature-writing/
skills/nature-reviewer/
skills/nature-citation/
skills/nature-data/
skills/nature-reader/
skills/nature-response/
skills/nature-paper2ppt/
skills/nature-paper-to-patent/
skills/nature-academic-search/
skills/nature-downloader/
skills/nature-literature-pipeline/
skills/nature-proposal-writer/
```

核心改动不是把 Nature 风格泛化地套到所有论文上，而是增加了 AI/RL 论文最容易被审稿人质疑的内容：

1. 问题定义是否清楚：MDP / POMDP / Dec-POMDP / Markov game / LLM-agent loop 是否写明。
2. 方法贡献是否真实：新算法、新训练范式、新评测协议、新系统框架、新理论边界是否区分。
3. 实验是否足够强：强基线、公平算力、随机种子、置信区间、消融、泛化、跨任务、跨模型、开销分析。
4. LLM Agent 是否可复现：模型版本、prompt、tool schema、memory、planner、environment、失败处理、日志与轨迹。
5. MARL 是否避免伪泛化：训练队友/测试队友拆分、未知伙伴、未知任务、零样本设置、CTDE/去中心化执行边界。
6. Safety / ethics / misuse 是否可交代：agent 自主执行、工具调用、数据泄漏、benchmark contamination、human feedback 来源。

## 安装到本地 Codex

推荐方式：

```bash
git clone https://github.com/vcis-wangchenxu/agent_nature-skills.git
cd agent_nature-skills
scripts/update-codex-skills.sh --pull
scripts/update-codex-skills.sh --check
```

如果你已经 clone 过：

```bash
cd agent_nature-skills
git pull --ff-only
scripts/update-codex-skills.sh --check
scripts/update-codex-skills.sh
```

安装位置默认是：

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

## 技能索引

| Skill | 状态 | 主要用途 |
|---|---:|---|
| `nature-writing` | Stable | RL/MARL/LLM/Agent 论文选题、摘要、引言、方法、实验、讨论写作 |
| `nature-polishing` | Stable | 面向高水平期刊的学术英语润色、中文转英文、LaTeX 表达修正 |
| `nature-figure` | Stable | RL 曲线、benchmark 表、消融图、agent 架构图、trajectory 图的投稿级制作与审查 |
| `nature-reviewer` | Stable | 模拟三位审稿人，从 novelty、rigor、reproducibility、significance 评审 |
| `nature-citation` | Beta | 构建 RL/MARL/LLM/Agent 文献证据链、引用核验、相关工作矩阵 |
| `nature-data` | Beta | 数据、代码、模型、prompt、日志、轨迹、environment 的可用性声明 |
| `nature-reader` | Beta | 精读论文，提取问题、方法、实验、局限、可复现要点 |
| `nature-response` | Stable | 审稿意见回复、补实验规划、rebuttal 风险控制 |
| `nature-paper2ppt` | Beta | 从论文生成中文/英文科研汇报 PPT 大纲与讲稿 |
| `nature-paper-to-patent` | Draft | 从算法/系统论文提炼可专利化技术方案，不替代法律意见 |
| `nature-academic-search` | Beta | 文献检索、证据图谱、benchmark/基线追踪 |
| `nature-downloader` | Draft | 合法获取论文全文、整理 PDF 与 BibTeX |
| `nature-literature-pipeline` | Beta | 建立 RL/LLM Agent 每日/每周文献跟踪管线 |
| `nature-proposal-writer` | Stable | 先建立 research proposal，再写论文，适合博士课题和 SCI 选题 |

## 共享设计原则

所有技能都先读取或遵守 `skills/_shared/` 中的公共规则：

- `field-taxonomy.md`：RL/MARL/LLM/Agent 方向分类与常见问题定义。
- `reproducibility-checklist.md`：实验、代码、随机种子、算力、prompt、模型版本检查。
- `nature-readiness-rubric.md`：投稿前 readiness 评分规则。

## 新增或修改技能的最低要求

每个技能目录至少包含：

```text
README.md
SKILL.md
```

`SKILL.md` 必须包含：

```yaml
---
name: nature-<topic>
description: ...
---
```

并明确：触发场景、输入范围、工作流、输出格式、红线、field-specific 审查点。

## 许可证

Apache-2.0。