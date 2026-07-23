---
name: dependency-upgrade
description: Plan and execute dependency upgrades in small risk-ordered batches with changelog review, lockfile control, and verification after each batch. Use for outdated packages, security updates, or runtime/toolchain upgrades.
---

# Dependency upgrades

## Inventory

Detect the package manager, lockfiles, runtime constraints, and canonical test gate. Record current versions and identify direct versus transitive dependencies.

Classify upgrades:

- security-critical
- low-risk tooling or patch/minor
- runtime minor
- runtime major or toolchain migration

Read authoritative release notes for security updates, majors, and packages with known compatibility coupling.

## Execution

Upgrade one coherent risk tier or coupled package family at a time. Preserve the existing package manager and lockfile. Do not mix unrelated code cleanup into upgrade changes.

After each batch:

1. inspect manifest and lockfile changes
2. run focused compatibility checks
3. run the project's canonical gate
4. investigate failures before proceeding

Keep runtime majors separate unless they must move together. Document required migrations, deprecations, and rollback points. Never claim a vulnerability is fixed without verifying the resolved dependency graph.
