#!/usr/bin/env python3
from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
NAME_RE = re.compile(r"^[a-z0-9]+(?:-[a-z0-9]+)*$")
errors: list[str] = []

for skill_dir in sorted((ROOT / "skills").iterdir()):
    if not skill_dir.is_dir():
        continue
    skill_file = skill_dir / "SKILL.md"
    if not skill_file.is_file():
        errors.append(f"{skill_dir}: missing SKILL.md")
        continue
    text = skill_file.read_text()
    match = re.match(r"^---\n(.*?)\n---\n", text, re.DOTALL)
    if not match:
        errors.append(f"{skill_file}: missing YAML frontmatter")
        continue
    fields: dict[str, str] = {}
    for line in match.group(1).splitlines():
        if ":" in line:
            key, value = line.split(":", 1)
            fields[key.strip()] = value.strip()
    name = fields.get("name", "")
    description = fields.get("description", "")
    if name != skill_dir.name:
        errors.append(f"{skill_file}: name must match directory ({skill_dir.name})")
    if not NAME_RE.fullmatch(name):
        errors.append(f"{skill_file}: invalid skill name {name!r}")
    if not description:
        errors.append(f"{skill_file}: missing description")
    if len(description) > 1024:
        errors.append(f"{skill_file}: description exceeds 1024 characters")

if errors:
    print("\n".join(errors), file=sys.stderr)
    raise SystemExit(1)
print(f"validated {len(list((ROOT / 'skills').glob('*/SKILL.md')))} skills")
