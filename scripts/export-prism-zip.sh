#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
STAMP="$(date +%Y%m%d-%H%M%S)"
OUT_PATH="${1:-$ROOT_DIR/build/prism-upload-$STAMP.zip}"
TMP_DIR="$(mktemp -d)"

mkdir -p "$(dirname "$OUT_PATH")"

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

rsync -a \
  --exclude '.git' \
  --exclude 'build' \
  --exclude '.DS_Store' \
  "$ROOT_DIR/" "$TMP_DIR/project/"

(cd "$TMP_DIR/project" && zip -qr "$OUT_PATH" .)

printf '%s\n' "$OUT_PATH"

