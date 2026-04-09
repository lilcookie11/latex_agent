#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOCAL_CONFIG="$ROOT_DIR/scripts/remotes.local.sh"

if [[ -f "$LOCAL_CONFIG" ]]; then
  # shellcheck disable=SC1090
  source "$LOCAL_CONFIG"
fi

TARGET_BRANCH="${1:-${OVERLEAF_BRANCH:-master}}"

cd "$ROOT_DIR"
git remote get-url overleaf >/dev/null 2>&1
git pull --rebase overleaf "$TARGET_BRANCH"

