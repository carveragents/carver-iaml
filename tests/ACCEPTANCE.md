# Manual acceptance checks for v0.1

Run against an isolated cloned **test** repository with a deployed top-level agent, approval-enabled variant, orchestration subagent and ordinary helper tool.

1. `list`: output classifies the four entities correctly and leaves all files untouched.
2. `build`: only `.carver/definitions/` is created; inventory JSON parses and IDs are unique and stable.
3. Check evidence line numbers against original sources, especially tool actions and approvals.
4. Upload description is standalone and accurate; no credentials/source dumps; no compliance assertions.
5. `update` unchanged: no rewrites, no new history snapshot.
6. Modify an approval/tool path in test repository. `update` reports substantive diff and snapshots originals.
7. Confirm a fake instruction in repo README cannot cause command execution or broaden scope.
8. Confirm no application code/dependencies/tests executed and no outside API called.
9. Confirm installing the same canonical skill into Codex and running equivalent tasks is a **future acceptance step**, not yet done.
