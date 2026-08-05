#!/usr/bin/with-contenv bashio
# ^ Standard Home Assistant S6 overlay bash declaration

# Bypass strict Corepack routing errors
export COREPACK_ENABLE_STRICT=0
export COREPACK_ENABLE_DOWNLOADS=0

echo "Installing node dependencies..."
cd /opt
CYPRESS_INSTALL_BINARY=0 pnpm install --frozen-lockfile --package-manager-strict=false

echo "Building production assets (Bypassing Supervisor Build Timeout)..."
pnpm build

echo "Cleaning up development dependencies..."
pnpm prune --prod

echo "{\"commitTag\": \"${COMMIT_TAG}\"}" > "/opt/committag.json"

echo "Starting application..."
exec pnpm start --package-manager-strict=false