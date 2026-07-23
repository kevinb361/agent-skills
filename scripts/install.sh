#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)
target_root=${AGENT_SKILLS_HOME:-"$HOME/.agents/skills"}
mode=${1:-install}

if [[ "$mode" != install && "$mode" != --check ]]; then
  echo "usage: $0 [--check]" >&2
  exit 2
fi

status=0
while IFS= read -r skill_dir; do
  name=${skill_dir##*/}
  target="$target_root/$name"
  if [[ "$mode" == --check ]]; then
    if [[ ! -L "$target" || "$(readlink -f -- "$target" 2>/dev/null || true)" != "$skill_dir" ]]; then
      echo "not linked: $target -> $skill_dir" >&2
      status=1
    fi
    continue
  fi

  mkdir -p -- "$target_root"
  if [[ -e "$target" || -L "$target" ]]; then
    if [[ -L "$target" && "$(readlink -f -- "$target" 2>/dev/null || true)" == "$skill_dir" ]]; then
      continue
    fi
    echo "refusing to replace existing path: $target" >&2
    status=1
    continue
  fi
  ln -s -- "$skill_dir" "$target"
  echo "linked: $target -> $skill_dir"
done < <(find "$repo_root/skills" -mindepth 1 -maxdepth 1 -type d -print | sort)

exit "$status"
