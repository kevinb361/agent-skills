---
name: adversarial-review
description: Attempt to falsify a code change's behavioral and operational claims using concrete counterexamples, hostile conditions, and failure sequences. Use as a deeper second-pass review for high-risk, stateful, concurrent, migration, recovery, or production-critical changes.
---

# Adversarial code review

Review only; do not edit files or remediate findings while this skill is active. This is a falsification pass, not a substitute for routine code review or a security threat model.

## Establish the claims

1. Determine the requested diff, commit, branch, pull request, or subsystem. Read project instructions and the complete relevant change.
2. Extract the behavior the change claims to provide from its code, tests, documentation, issue, or specification.
3. State the invariants and environmental assumptions required by those claims. Label inferred claims as inferred rather than attributing them to the author.
4. Prioritize claims whose failure could cause data loss, corruption, prolonged outage, unsafe rollback, compatibility breakage, or silent incorrect behavior.

## Try to falsify them

Construct concrete counterexamples using the relevant dimensions below:

- malformed, extreme, duplicated, stale, reordered, or partially valid input
- interruption between state transitions or partial dependency failure
- retries, replay, timeout, cancellation, and non-idempotent recovery
- concurrency, scheduling, reentrancy, and changed ordering
- resource exhaustion, backpressure, and unbounded growth
- old data, mixed versions, schema drift, and downgrade or rollback
- dependency behavior that is legal but inconvenient
- restart, crash recovery, clock changes, and lost in-memory state
- configuration drift, missing prerequisites, and plausible operator error

Trace each promising counterexample through callers, persistence, side effects, error handling, cleanup, and recovery. Run safe, bounded diagnostic commands or existing tests when they can discriminate between outcomes. Do not weaken the standard of evidence merely because a failure is plausible.

Do not report generic edge cases. A finding must identify the exact conditions and sequence that violate a claim. Do not duplicate ordinary review findings unless the adversarial path adds a materially different failure mode. Route attacker-driven trust-boundary analysis to `security-review`.

## Output

Separate results into:

1. **Falsified claims** — confirmed or strongly grounded failures, ordered by severity.
2. **Surviving claims** — important claims that resisted the attempted counterexamples, with the checks performed.
3. **Untested claims** — important claims that could not be meaningfully challenged and why.

Each falsified claim must include:

- severity
- `path:line`
- the claimed invariant or behavior
- the concrete counterexample, including preconditions and event sequence
- resulting impact
- specific remediation
- a test or check that would prove the remediation

If no claim is falsified, say so without declaring the change safe. Report the strongest attempted counterexamples and the remaining verification gaps.
