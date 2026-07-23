#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)
tmp=$(mktemp -d)
trap 'rm -rf -- "$tmp"' EXIT

cd -- "$repo_root"
./scripts/validate.py
python3 -m py_compile scripts/validate.py
shellcheck scripts/*.sh

AGENT_SKILLS_HOME="$tmp/skills" ./scripts/install.sh
AGENT_SKILLS_HOME="$tmp/skills" ./scripts/install.sh --check

expected=$(find skills -mindepth 1 -maxdepth 1 -type d | wc -l)
installed=$(find "$tmp/skills" -mindepth 1 -maxdepth 1 -type l | wc -l)
[[ "$installed" -eq "$expected" ]]

while IFS= read -r link; do
  [[ -f "$link/SKILL.md" ]]
done < <(find "$tmp/skills" -mindepth 1 -maxdepth 1 -type l -print)

git diff --check
printf 'check passed: %s skills\n' "$expected"
