# Agent domain overlay

This directory is copied into the generated full Nature Skills tree during installation.

The default installer first builds a staging tree from the upstream `Yuan1z0825/nature-skills` repository, then overlays this directory, and finally adds a small field hook to installed Nature skills.

The main file is `agent-domain-extension.md`, which adds field-specific checks for RL, MARL, LLM and LLM Agent research while preserving the original upstream Nature-skill workflow.
