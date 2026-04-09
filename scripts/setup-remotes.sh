#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOCAL_CONFIG="$ROOT_DIR/scripts/remotes.local.sh"

if [[ -f "$LOCAL_CONFIG" ]]; then
  # shellcheck disable=SC1090
  source "$LOCAL_CONFIG"
fi

GITHUB_URL="${1:-${GITHUB_REMOTE_URL:-}}"
OVERLEAF_URL="${2:-${OVERLEAF_REMOTE_URL:-}}"

cd "$ROOT_DIR"

set_remote() {
  local name="$1"
  local url="$2"
  if git remote get-url "$name" >/dev/null 2>&1; then
    git remote set-url "$name" "$url"
  else
    git remote add "$name" "$url"
  fi
}

if [[ -n "$GITHUB_URL" ]]; then
  set_remote origin "$GITHUB_URL"
fi

if [[ -n "$OVERLEAF_URL" ]]; then
  set_remote overleaf "$OVERLEAF_URL"
fi

git remote -v

