# Carver Legal Readiness Skill — v0.1

One canonical Agent Skill for repository-based AI-agent discovery and evidence-backed definitions. **Claude Code first**, with portable instructions suitable for later Codex testing. No legal conclusions or automatic Carver submission.

## Install into an existing cloned agent repository

Clone or unpack this skill bundle separately, then from the skill bundle root:

```bash
./install.sh --claude --project /absolute/path/to/cloned-agent-repo
```

This creates `<repo>/.claude/skills/carver-legal-readiness` as a symlink to the canonical skill. Run Claude Code with the **target cloned repo** as its working directory and enter:

```text
/carver-legal-readiness list
/carver-legal-readiness build
/carver-legal-readiness update
```

Calling `/carver-legal-readiness` by itself builds or updates. `list`, `build`, `update` are skill arguments/intents, not separate registered commands. Reopen/restart Claude Code if it doesn't discover a newly installed skill.

## Alternative installation

`./install.sh --claude --user` installs to `~/.claude/skills/`. `--codex` selects `.agents/skills/` for project installation or `~/.agents/skills/` for user installation. `--both` installs both hosts. `--copy` copies instead of symlinking. Run `./install.sh --help` for options. **Codex execution is not yet validated.** The installer refuses to replace existing paths; remove/relocate the old installation yourself before switching between copy/link modes. Symlinks track canonical edits automatically; copies must be reinstalled to update (after reviewing/removing the old copy).

## Outputs

`<target>/.carver/definitions/agents.json`, `<agent-id>.md`, `upload/<agent-id>.txt`, and `questions.md`. Prior generated versions are preserved in `history/` before material changes. `list` writes nothing.

## Safety and limitations

The skill reads local source as evidence without executing agent code, installing repo dependencies or invoking external services. It does not do legal research, determine compliance, or submit outputs. Verify sensitive descriptions before uploading them. This is an instruction-driven first scaffold; test discovery and citation fidelity on a real sample repository before relying on results.

## Development

Edit only `skill/carver-legal-readiness/` to change cross-host behavior. See `MASTER_SPECIFICATION.md` for the wider roadmap. Files named `tests/` contain non-executable manual acceptance checks for this initial release.
