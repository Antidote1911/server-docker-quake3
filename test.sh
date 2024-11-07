#!/bin/bash
set -euo pipefail
docker-compose run ioquake3_ra | tee ioquake3_ra.log || failed=yes
docker-compose logs --no-color > docker-compose.log
[[ -z "${failed:-}" ]] || exit 1
