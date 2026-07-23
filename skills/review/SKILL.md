---
name: review
description: Perform a read-only review of code changes for concrete bugs, security risks, regressions, performance problems, and missing tests. Use for staged, unstaged, commit, branch, or pull-request diffs.
---

# Code review

Review only; do not edit files while this skill is active.

## Scope

Determine the requested scope. With no explicit scope, inspect staged changes first, then unstaged changes, then the latest commit. For branch review, find the actual merge base rather than assuming a branch name.

Confirm the working directory before every Git command. Stop if there is no diff to review.

## Method

1. Read project instructions.
2. Inspect the complete diff and changed-file list.
3. Read enough surrounding implementation and tests to understand the changed behavior. Read full hand-written files when practical; do not waste context on generated files, lockfiles, or vendored code when a targeted inspection is sufficient.
4. Trace callers, data boundaries, error paths, and state transitions affected by the change.
5. Check tests for changed behavior, boundaries, and failure paths.
6. Report only issues introduced or exposed by the reviewed change.

Prioritize correctness, security, data loss, concurrency, compatibility, resource leaks, operational failure modes, and meaningful performance regressions. Do not report formatting preferences or speculative concerns without a concrete failure scenario.

## Findings

Order findings by severity. Each finding must include:

- severity
- `path:line`
- the concrete failure or risk
- why the change causes it
- a specific remediation

If no material issue is found, say so and mention any verification gap that limits confidence. Do not claim that code is safe to merge solely because no issue was found.
