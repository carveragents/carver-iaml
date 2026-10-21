#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: ./install.sh (--claude|--codex|--both) (--project PATH|--user) [--copy]

Install canonical skill to a target repository (project) or home skill folder.
Defaults: --claude --project CURRENT_DIRECTORY; use explicit --project for clarity.
Refuses to overwrite any existing file, folder or symlink.
EOF
}

HOST=claude
MODE=project
TARGET="$PWD"
COPY=0
while (($#)); do
  case "$1" in
    --claude) HOST=claude;;
    --codex) HOST=codex;;
    --both) HOST=both;;
    --project) [[ $# -ge 2 ]] || { echo 'Missing path for --project' >&2; exit 2; }; MODE=project; TARGET=$2; shift;;
    --user) MODE=user;;
    --copy) COPY=1;;
    -h|--help) usage; exit 0;;
    *) echo "Unknown argument: $1" >&2; usage >&2; exit 2;;
  esac
  shift
done

SOURCE="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/skill/carver-legal-readiness" && pwd -P)"
if [[ "$MODE" == project ]]; then
  [[ -d "$TARGET" ]] || { echo "Target repository directory not found: $TARGET" >&2; exit 2; }
  TARGET="$(cd "$TARGET" && pwd -P)"
fi

install_one() {
  local host=$1 parent dest
  if [[ "$MODE" == user ]]; then
    if [[ $host == claude ]]; then parent="$HOME/.claude/skills"; else parent="$HOME/.agents/skills"; fi
  else
    if [[ $host == claude ]]; then parent="$TARGET/.claude/skills"; else parent="$TARGET/.agents/skills"; fi
  fi
  dest="$parent/carver-legal-readiness"
  if [[ -e "$dest" || -L "$dest" ]]; then
    echo "Already exists, refusing overwrite: $dest" >&2
    return 1
  fi
  mkdir -p "$parent"
  if ((COPY)); then cp -R "$SOURCE" "$dest"; else ln -s "$SOURCE" "$dest"; fi
  echo "Installed $host: $dest"
}

case "$HOST" in
  claude) install_one claude;;
  codex) install_one codex;;
  both) install_one claude; install_one codex;;
esac
