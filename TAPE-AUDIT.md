# TAPE-AUDIT — browser-harness

> Audit-class survey for `.tape` adoption (typed events + provenance edges + delivery grade).

## A. Audit-class ledgers
**CARGO only.** `state/markers/browser_harness_self_mk2_tuning_landed.marker` — single tuning marker, pure cargo. No `.jsonl` event ledgers, no `audit/` dir. README mentions "machine-parseable contract sentinels" + "deterministic resolver priority" — these are runtime invariants, not historized events.

## B. Identity surface
**Browser-context identity** (per fresh-context factory invocation) is fleeting. Each context = an ephemeral session; no persistent identity surface. Tests in `tests/` generate per-test traces but they live in node_modules-adjacent test output.

## C. Domain.md files
Minimal: `AGENTS.md`, `CLAUDE.md`, `README.md`. No further UPPERCASE.md root files.

## D. Per-run / per-event history
None at the repo level. Playwright traces (per-context) could be a tape source but they're Playwright's artifact format, not ours. The "probe + selftest" output isn't historized in a structured ledger.

## E. Promotion candidates
- **`.tape` events (LOW-MED)**: per-probe-run could emit `@R` events with browser-context `@S` provenance. Today it's not captured persistently.
- **n6 atoms (LOW)**: selector / resolver-priority facts could be atom-shaped but are stable constants.
- **n12 cube**: not applicable.
- **hxc wire (MED conceptually)**: AI-native invocation w/ contract sentinels IS a wire-level use case — `.hxc` could carry probe results to caller agents.

## Verdict
**LIGHT** — browser-harness is a runtime tool, not an event source. Markers are cargo. The closest fit is `.hxc` for AI-invocation wire format, not `.tape` for historized events.
