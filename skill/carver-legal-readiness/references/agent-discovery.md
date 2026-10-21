# Agent discovery procedure

## Read in order
1. Determine repository root, scope, active Git revision/dirty state. Avoid large generated, dependency, vendor, secret or binary directories; inspect their existence without copying values.
2. Review README and package manifests for architecture claims (documentation evidence only).
3. Locate deployment/runtime entry points: service routes, executable scripts, workers, job schedules, frameworks, orchestrators, containers and agent registries.
4. Trace reachable workflow construction, dispatch, prompts, tools, external calls, approvals, persistence, logs and result delivery.
5. Cross-check configuration/environment switches and tests. Static configuration is not runtime verification.

## Classification
- `deployable_agent`: separately exposed or configured executable agentic workflow with meaningful delegated reasoning/decision/action.
- `deployment_variant`: same underlying agent with materially different exposure, enabled tools, approval requirements, audience or data handling. Set `variant_of`.
- `subagent`: invoked by and subordinate to a coordinating agent. Set `subagent_of`.
- `tool_component`: helper, plain callable, model wrapper, prompt or tool; **not** an independently deployed agent.
- `non_agent_llm_application`: LLM feature without meaningful delegation. Mention in discovery report if material, but do not count it among deployable agents.

Do not count every `create_agent`, LLM call, function, file or class as a separate deployable agent. Prefer observable wiring and runtime boundaries over names. Handle LangChain/LangGraph, Deep Agents, OpenAI Agents SDK, CrewAI, AutoGen, and bespoke orchestrators without assuming any particular framework is present. Track graph edges and shared tools without multiplying agents. Unknown deployment is unknown, not production.

## Inspection checklist for each agent
- stable deployment/entry-point identity; label; product/organization *if evidenced*
- initiating user/event, user types, operator, persons affected
- input, main steps, outputs, delegated decisions, autonomous actions, limits, failure and escalation paths
- tool APIs and read vs write/external/cost/financial/consequential effects
- configured model/provider and fallback (not guaranteed runtime behavior)
- data received, searched, stored, sent and logged; external processors; retention only if observed
- prompt restrictions vs actual permission checks, middleware, approvals, evaluations and logs
- production status, geography, regulated context only if evidenced; otherwise targeted unknown questions

Search for approval gates and feature flags on each relevant entry path, not just imports. Separate demo/test variants from deployable configurations. Assign IDs deterministically from normalized deployment key + entry point; if there is a collision append a short stable path-derived suffix. Reuse known prior IDs for the same identity.
