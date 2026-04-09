#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOCAL_CONFIG="$ROOT_DIR/scripts/remotes.local.sh"

if [[ -f "$LOCAL_CONFIG" ]]; then
  # shellcheck disable=SC1090
  source "$LOCAL_CONFIG"
fi

TARGET_BRANCH="${OVERLEAF_BRANCH:-master}"
SOURCE_BRANCH="${1:-HEAD}"

cd "$ROOT_DIR"
git remote get-url overleaf >/dev/null 2>&1
git push overleaf "${SOURCE_BRANCH}:${TARGET_BRANCH}"

