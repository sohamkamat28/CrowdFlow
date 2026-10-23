#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

if [ ! -x .venv/bin/python ]; then
  python_bin=""
  for candidate in python3.12 python3 python; do
    if command -v "$candidate" >/dev/null 2>&1 && "$candidate" -c 'import sys; sys.exit(sys.version_info[:2] != (3, 12))' 2>/dev/null; then
      python_bin="$candidate"
      break
    fi
  done
  if [ -z "$python_bin" ]; then
    echo "Python 3.12 is required. Install it from https://www.python.org/downloads/ and rerun bash setup.sh."
    exit 1
  fi
  "$python_bin" -m venv .venv
fi

if ! .venv/bin/python -c 'import sys; sys.exit(sys.version_info[:2] != (3, 12))'; then
  echo "The existing .venv uses a different Python version. Rename it, install Python 3.12, and rerun setup."
  exit 1
fi
if ! .venv/bin/python -m pip --version >/dev/null 2>&1; then
  .venv/bin/python -m ensurepip --upgrade
fi
.venv/bin/python -m pip install -r requirements.txt
echo "Setup complete. Start the app with: bash run.sh"
