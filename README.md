# agent-skills

> [!IMPORTANT]
> This repository is archived. Its capabilities were consolidated into
> [Saga v2.0.0](https://github.com/kevinb361/saga/releases/tag/v2.0.0), the
> canonical `ops-*` and `saga-*` operator toolbox. This source remains available
> for history and migration provenance; use Saga for new installs and updates.

A deliberately small set of reusable, harness-neutral engineering skills.

## Included

- `adversarial-review` — falsification-focused review for hostile conditions and failure sequences
- `api-design` — HTTP interface design and review
- `debug` — evidence-driven debugging
- `dependency-upgrade` — bounded dependency upgrades
- `design-an-interface` — compare multiple interface shapes before committing
- `review` — read-only code review
- `security-review` — threat-model-driven security review
- `tdd` — vertical-slice red/green/refactor workflow
- `verify-before-complete` — fresh evidence before completion claims
- `write-docs` — reader-oriented technical documentation

Routine actions such as running a formatter or test command are intentionally not skills.

## Install

```bash
./scripts/install.sh
```

The installer creates symlinks in `~/.agents/skills/` and leaves unrelated skills untouched. Restart the agent harness after installation so it rediscovers skills.

Check wiring without changing anything:

```bash
./scripts/install.sh --check
./scripts/validate.py
```

Run the complete local/CI gate:

```bash
./scripts/check.sh
```

## Repository ownership

- This repository is historical and read-only after archival.
- [Saga](https://github.com/kevinb361/saga) is the canonical package and installation source.
- Existing clones and symlinks are retained only for rollback provenance; new installs use Saga's documented migration and installer.

## Principles

- No planning-framework or harness coupling.
- No hidden mutation in review-only skills.
- Evidence before claims.
- Concrete workflows, minimal ceremony.
- Version-controlled source; installed copies are symlinks.
