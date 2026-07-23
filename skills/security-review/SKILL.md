---
name: security-review
description: Review a change or subsystem using an explicit threat model. Use for authentication, authorization, untrusted input, secrets, external services, filesystem access, deployment, or other security-sensitive surfaces.
---

# Security review

Remain read-only unless the user separately asks for remediation.

## Threat model

Identify:

- protected assets
- trust boundaries and actors
- attacker-controlled inputs
- privileged operations
- persistence and audit surfaces
- availability dependencies

Then examine relevant code and configuration for spoofing, tampering, repudiation gaps, information disclosure, denial of service, and privilege escalation. Also check default behavior, error handling, secret lifecycle, dependency trust, and fail-open paths.

Do not produce generic checklist findings. Every reported issue needs a plausible exploit or failure path grounded in the implementation.

## Output

For each finding provide:

- severity: critical, high, medium, or low
- `path:line`
- affected asset and trust boundary
- exploit scenario and required preconditions
- impact
- concrete remediation
- a test or check that would prove the remediation

Separate confirmed findings from defense-in-depth suggestions. If no finding survives inspection, state that clearly and list any unreviewed boundary that limits confidence.
