---
name: design-an-interface
description: Explore at least three materially different designs for a module, library, command, or service interface, compare their tradeoffs, and recommend one. Use when interface shape or module boundaries are the hard part.
---

# Design an interface

Do not stop at the first plausible shape.

1. Identify consumers, invariants, failure modes, lifecycle, and likely change axes.
2. Produce at least three materially different designs. Differences must involve ownership, state, abstraction boundary, or misuse resistance—not renamed methods.
3. Show a small usage example for each.
4. Compare complexity, coupling, testability, observability, compatibility, misuse resistance, and migration cost.
5. Recommend a default and explain why it fits the actual constraints.
6. Record unresolved decisions that block implementation.

Favor deep modules: simple consumer-facing contracts that hide justified complexity. Avoid speculative generality and configuration knobs without a demonstrated consumer.
