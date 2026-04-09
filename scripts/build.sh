#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build main.tex

