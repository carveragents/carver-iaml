# <Agent display name>

- **ID:** `<agent-id>`
- **Classification:** deployable_agent | deployment_variant | subagent
- **Relationship:** variant_of / subagent_of / none
- **Repository revision:** `<git-sha-or-unavailable>` (worktree dirty: yes/no/unknown)
- **Entry point(s):** `path:lines`

## Summary and intended users
Describe what exists. Distinguish evidenced claims from inferences.

## Workflow and authority
Trigger → inputs → steps → outputs. Who/what decides, acts, approves, escalates, or stops? Cite consequential behavior.

## Tools and external effects
Separate read-only access from writes, external messages and consequential transactions.

## Models and data
Configured models; personal/sensitive data categories, external destinations, logging, storage and retention **only where evidenced**.

## Controls and evidence
For each control, distinguish documented or prompted policy, implementation, configuration, tests, and runtime verification. Use `observed` / `inferred` / `unknown` and original `path:start-end` references.

## Deployment assumptions and unknowns
Do not infer jurisdiction, customer, production status, legal requirements or security assurances.

## Evidence ledger
| Claim | Status | Evidence kind | Source and lines | Qualification |
|---|---|---|---|---|

## Priority questions for reviewer
Questions that would materially alter the assessment.
