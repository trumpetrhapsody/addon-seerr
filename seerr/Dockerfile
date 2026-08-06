FROM ghcr.io/hassio-addons/base:18.2.1

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG SEERR_VERSION="3.4.1"
ARG SEERR_ARTIFACT_SHA256="a0265ab3afa9123119710ea46756b0a0f08eab046d97b51118f6d60e91c71572"

ENV \
    COMMIT_TAG="v${SEERR_VERSION}" \
    CYPRESS_INSTALL_BINARY="0" \
    NEXT_TELEMETRY_DISABLED="1"

WORKDIR /opt

RUN \
    apk add --no-cache \
        npm \
        curl \
        tar \
    && curl \
        --fail \
        --show-error \
        --silent \
        --location \
        --retry 3 \
        --retry-delay 5 \
        --output /tmp/seerr-prebuilt.tar.gz \
        "https://github.com/trumpetrhapsody/addon-seerr/releases/download/seerr-artifact-v${SEERR_VERSION}/seerr-${SEERR_VERSION}-prebuilt.tar.gz" \
    && echo "${SEERR_ARTIFACT_SHA256}  /tmp/seerr-prebuilt.tar.gz" \
        | sha256sum -c - \
    && tar \
        --extract \
        --gzip \
        --file /tmp/seerr-prebuilt.tar.gz \
        --directory /opt \
    && rm -f /tmp/seerr-prebuilt.tar.gz \
    && test -f /opt/package.json \
    && test -f /opt/pnpm-lock.yaml \
    && test -f /opt/dist/index.js \
    && test -d /opt/.next \
    && PACKAGE_MANAGER="$(node -e \
        'process.stdout.write(require("/opt/package.json").packageManager || "")')" \
    && if [[ "${PACKAGE_MANAGER}" != pnpm@* ]]; then \
         echo "Invalid or missing packageManager in package.json: ${PACKAGE_MANAGER}" >&2; \
         exit 1; \
       fi \
    && npm install --global "${PACKAGE_MANAGER}" \
    && CI=true pnpm install --prod --frozen-lockfile \
    && pnpm store prune \
    && apk del curl tar \
    && rm -rf /root/.npm /root/.cache /tmp/*

COPY rootfs /

ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="app" \
    io.hass.version="${BUILD_VERSION}" \
    maintainer="trumpetrhapsody" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="trumpetrhapsody" \
    org.opencontainers.image.authors="trumpetrhapsody" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://github.com/trumpetrhapsody/addon-seerr" \
    org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
    org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/main/README.md" \
    org.opencontainers.image.created="${BUILD_DATE}" \
    org.opencontainers.image.revision="${BUILD_REF}" \
    org.opencontainers.image.version="${BUILD_VERSION}"
