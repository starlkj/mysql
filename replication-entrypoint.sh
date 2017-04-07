#!/bin/bash
set -eo pipefail

exec docker-entrypoint.sh "$@"
