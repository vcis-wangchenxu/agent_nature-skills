---
name: nature-citation
description: Build, audit, and organize citation evidence for RL, MARL, LLM, and LLM Agent manuscripts. Use for related work matrices, citation gaps, DOI/BibTeX checks, baseline provenance, benchmark provenance, and Nature-style support for claims.
version: 2.0.0-agent-rl
---

# Citation and evidence-chain skill

## Default stance

Every citation must support a specific claim. Do not add famous papers as decoration.

## Workflow

1. Extract claims needing citations: problem importance, prior limitation, method lineage, benchmark, baseline, metric, safety concern.
2. Classify each citation role: foundational, direct predecessor, competing baseline, benchmark/dataset, theory, empirical evidence, limitation/safety.
3. For RL/MARL/LLM/Agent papers, separate:
   - algorithmic ancestors;
   - benchmark or environment sources;
   - baselines and official implementations;
   - evaluation protocols;
   - safety/ethics references.
4. Identify missing citations and over-cited statements.
5. Prefer primary sources, official benchmark papers and recent strong baselines.
6. When web access is available, verify DOI/arXiv/version/date before finalizing.

## Output format

```text
Citation map
| Claim | Required source type | Candidate citations | Risk if unsupported |

Related-work structure
- paragraph 1:
- paragraph 2:
- paragraph 3:

Citation risks
- outdated baseline:
- missing benchmark source:
- unsupported broad claim:
```

## Red lines

Do not fabricate references, DOIs, BibTeX entries or author names. If verification is unavailable, label citations as unverified.
