#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOKEN_PATH="${SCRIPT_DIR}/.secrets/github-pat"

if [[ ! -f "${TOKEN_PATH}" ]]; then
  echo "GitHub PAT not found at ${TOKEN_PATH}" >&2
  exit 1
fi

TOKEN="$(<"${TOKEN_PATH}")"

exec mcp-proxy --transport streamablehttp \
  -H Authorization "Bearer ${TOKEN}" \
  https://api.githubcopilot.com/mcp/
