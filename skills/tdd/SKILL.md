---
name: tdd
description: Build behavior test-first using thin vertical slices and explicit red-green-refactor loops. Use when the user requests TDD or when a stable observable contract should drive implementation.
---

# Test-driven development

Work in vertical behavior slices rather than building all tests, then all internals.

For each slice:

1. State one observable behavior and boundary.
2. Add the smallest test that expresses it through a stable public surface.
3. Run the focused test and confirm it fails for the intended reason.
4. Implement the minimum coherent behavior.
5. Run the focused test and relevant nearby tests.
6. Refactor only while green.
7. Repeat with the next behavior, edge case, or failure path.

Do not write tests that merely mirror implementation details. Do not weaken assertions to obtain green. If the test passes before implementation, determine whether the behavior already exists or the test is ineffective.

At completion, run the project's canonical gate and report both the initial red evidence and final verification.
