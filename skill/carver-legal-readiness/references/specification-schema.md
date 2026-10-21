# Output contract v0.1

All paths here are relative to the **analyzed repo root**. For `list`, write nothing.

```text
.carver/definitions/
  agents.json
  <agent-id>.md
  upload/<agent-id>.txt
  questions.md
  history/<run-id>/...  # only when content changed, snapshot before replacement
```

`agents.json` is JSON (not JSONC). Minimum contract:

```json
{
  "schema_version": "0.1",
  "repository": {"root": ".", "git_commit": null, "git_dirty": null},
  "agents": [
    {
      "id": "medical-qa",
      "name": "Medical QA",
      "classification": "deployable_agent",
      "entry_points": ["src/agent.py"],
      "purpose": "Answers questions using retrieved information",
      "relationships": {"variant_of": null, "subagent_of": null},
      "evidence": [
        {"claim": "Exposes a user question workflow", "status": "observed", "kind": "implementation", "path": "src/agent.py", "start_line": 10, "end_line": 20}
      ],
      "unknowns": ["Production deployment is not established"]
    }
  ]
}
```

Values in the example are illustrative only. `classification` values: `deployable_agent`, `deployment_variant`, `subagent`; ordinary tools and non-agent LLM features may be described in reports but do not require agent definitions. `status` values: `observed`, `inferred`, `unknown`. When no source line applies, omit `path/start_line/end_line` and record explanation in `claim`. `kind` on cited observed evidence: `implementation`, `configuration`, `documentation`, `test`. Relationship IDs must exist in inventory, otherwise mark unresolved explicitly in reviewer Markdown rather than manufacturing an ID. IDs use lowercase letters, digits and hyphens. Keep predictable field names and ordering.

Reviewer Markdown: follow the agent specification template; reference line-level evidence for significant assertions and distinguish unknowns. Upload plain text: follow upload template, standalone, business-readable, without citations dumping source or implying compliance. `questions.md`: prioritized questions that could materially affect legal review, grouped by agent and marked as unanswered rather than assumed.

Versioning: before material changes copy the previous current generated files that will change into an immutable `history/<run-id>/` preserving relative structure; don't overwrite or prune history. If you cannot confidently differentiate generated output from user edits, stop for that file and report conflict. Report added/removed/changed/unchanged identities and control/action differences. A disappeared agent is reported; don't silently delete its old definition.
