# agent-skills

A deliberately small set of reusable, harness-neutral engineering skills.

## Included

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

- GitHub is the public canonical repository.
- The internal Gitea repository is an automatically updated pull mirror.
- Installed skill directories are symlinks into a local clone.
- Update flow: edit, run `./scripts/check.sh`, push to GitHub, then pull on installed machines.

## Principles

- No planning-framework or harness coupling.
- No hidden mutation in review-only skills.
- Evidence before claims.
- Concrete workflows, minimal ceremony.
- Version-controlled source; installed copies are symlinks.
