#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BRANCH="${1:-main}"

cd "$ROOT_DIR"
git remote get-url origin >/dev/null 2>&1
git push -u origin "$BRANCH"

