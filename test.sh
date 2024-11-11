#!/bin/bash
set -euo pipefail
DOCKER_BUILDKIT=0 docker-compose run ioquake3_ffa | tee ioquake3_ffa.log || failed=yes
docker-compose logs --no-color > docker-compose.log
[[ -z "${failed:-}" ]] || exit 1
