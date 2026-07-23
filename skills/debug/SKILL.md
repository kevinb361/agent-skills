---
name: debug
description: Diagnose difficult or recurring failures with an evidence-driven hypothesis loop. Use when the cause is unclear, normal troubleshooting failed, or retries would otherwise be speculative.
---

# Evidence-driven debugging

Do not change code until the failure is characterized.

1. State the observed symptom precisely, including scope and timing.
2. Reproduce it with the smallest safe command, or collect bounded logs and state if reproduction is unsafe.
3. Separate facts from assumptions.
4. Form a short ranked list of falsifiable hypotheses.
5. Test one discriminating hypothesis at a time.
6. Update the ranking from evidence; do not repeat a failed action unchanged.
7. Fix the root cause with the smallest coherent change.
8. Re-run the original reproduction and relevant regression checks.

Preserve useful diagnostics. Do not silence exceptions, weaken tests, add arbitrary retries, or widen timeouts unless evidence shows that behavior is correct.

When reporting, include the root cause, evidence that ruled alternatives in or out, the fix, and fresh verification.
