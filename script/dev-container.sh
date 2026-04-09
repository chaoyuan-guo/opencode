#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.."; pwd)"

export HOST_REPO_ROOT="${repo_root}"
export HOST_KNOWLEDGE_ROOT="/Users/guochaoyuan/context-infrastructure/formal_projects/knowledge_data"

mkdir -p "${HOST_KNOWLEDGE_ROOT}"

exec docker compose -f "${repo_root}/docker-compose.dev.yml" "$@"
