#!/bin/bash
# hx build hook — installs Node deps (playwright-core; no browser binaries).
# Browser binaries are NOT auto-downloaded. To install firefox locally:
#   cd ~/.hx/packages/browser-harness && npx playwright install firefox
set -e

cd "${HX_PKG_DIR:-$(dirname "$0")}"

if ! command -v npm >/dev/null 2>&1; then
  echo "install.sh: FATAL — npm not found. Install Node >=18 first." >&2
  exit 1
fi

echo "install.sh: installing deps (playwright-core, no browser binaries)..."
# Prefer `npm ci` (lockfile-pinned, never writes lockfile). Fall back to
# `npm install` if the lockfile is missing (rare — fresh checkout always
# carries one). v0.2.1: see bin/browser-harness for the same pattern.
if [ -f package-lock.json ]; then
  npm ci --omit=dev --no-audit --no-fund --silent --no-progress 2>&1 | tail -5 || {
    echo "install.sh: npm ci failed" >&2
    exit 1
  }
else
  npm install --omit=dev --no-audit --no-fund --silent --no-progress 2>&1 | tail -5 || {
    echo "install.sh: npm install failed" >&2
    exit 1
  }
fi

echo "install.sh: OK. Run 'browser-harness probe' to verify."
echo "install.sh: For browser binaries: cd $(pwd) && npx playwright install firefox"
