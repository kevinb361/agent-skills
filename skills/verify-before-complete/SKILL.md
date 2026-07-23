---
name: verify-before-complete
description: Require fresh, task-relevant evidence before claiming work is complete, fixed, passing, deployable, or ready to merge. Use at completion and release checkpoints.
---

# Verify before completion

Evidence must precede the claim in the current turn.

1. Identify the exact claim about to be made.
2. Choose the narrowest command or inspection that directly proves it.
3. Run it now against the current working tree or live state, as appropriate.
4. Read the result and exit status.
5. Report the evidence, including failures and known gaps.

Do not substitute an earlier run, expected behavior, another agent's report, or code inspection for fresh verification. A partial check supports only a partial claim. If verification cannot run, say what remains unverified instead of declaring success.

For code changes, prefer the project's canonical gate. Also inspect the final diff for accidental files, secrets, and unrelated edits. For live systems, distinguish repository validation from deployment and runtime health.
