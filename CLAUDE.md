# agent-skills

Small, harness-neutral skills for recurring software-engineering work. Skills must earn their place by adding a concrete workflow, safety gate, or review discipline that a capable coding agent would not reliably apply from a short prompt alone.

## Change Policy

- Development project; freely editable with review and verification.
- Keep skills compatible with the Agent Skills `SKILL.md` convention.
- Do not couple skills to a particular planning framework, coding harness, provider, project, or host.
- Prefer concise instructions and observable checks over ceremony.
- Do not add a skill that merely restates normal coding-agent behavior.
- Skills are read-only unless their purpose clearly requires edits.

## Layout

```text
skills/          Curated skill directories
scripts/         Installation and validation helpers
README.md        Installation and maintenance guide
```

## Commands

```bash
./scripts/check.sh
./scripts/validate.py
./scripts/install.sh
./scripts/install.sh --check
```

## Cross-CLI

`AGENTS.md` is a symlink to this file. Codex reads `AGENTS.md`; Claude Code reads `CLAUDE.md`. Pi discovers installed links under `~/.agents/skills/`.
