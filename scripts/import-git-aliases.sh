#!/usr/bin/env bash
set -euo pipefail

QUIET=${QUIET:-0}
info() { [ "$QUIET" -eq 0 ] && echo "$@" || true; }

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SOURCE="$REPO_ROOT/git/aliases.gitconfig"
CONFIG_DIR="$HOME/.config/git"
TARGET="$CONFIG_DIR/aliases.gitconfig"

if [ ! -f "$SOURCE" ]; then
  echo "Cannot find git/aliases.gitconfig next to this script." >&2
  exit 1
fi

mkdir -p "$CONFIG_DIR"
cp -f "$SOURCE" "$TARGET"
info "Copied aliases to $TARGET"

# Add include.path if not already present
if ! git config --global --get-all include.path | grep -Fxq "$TARGET" 2>/dev/null; then
  git config --global --add include.path "$TARGET"
  info "Added include.path to global config"
else
  info "Include already present in global config"
fi

info "Done. Try: git brlast"


