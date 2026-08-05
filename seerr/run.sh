#!/usr/bin/with-contenv bashio
set -Eeuo pipefail

cd /opt

if [[ ! -f package.json ]]; then
    bashio::log.fatal "Seerr package.json was not found in /opt."
    exit 1
fi

if [[ ! -f committag.json ]]; then
    printf '{"commitTag":"%s"}\n' "${COMMIT_TAG}" > /opt/committag.json
fi

bashio::log.info "Starting Seerr ${COMMIT_TAG}..."

exec pnpm start
