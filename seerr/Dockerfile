ARG BUILD_FROM=ghcr.io/hassio-addons/base:18.2.1
FROM ${BUILD_FROM}

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG SEERR_VERSION="3.4.1"
ARG SEERR_ARTIFACT_SHA256="15e2d75dfc2bd8c99f78876c7a81e7921f32cb5f0433dee3355e90cfec93e365"

ENV \
    CI="true" \
    COMMIT_TAG="v${SEERR_VERSION}" \
    CYPRESS_INSTALL_BINARY="0" \
    NEXT_TELEMETRY_DISABLED="1"

WORKDIR /opt

RUN \
    apk add --no-cache \
        nodejs \
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
    && PACKAGE_MANAGER="$(node -e \
    'process.stdout.write(require("/opt/package.json").packageManager || "")')" \
    && if [[ "${PACKAGE_MANAGER}" != pnpm@* ]]; then \
         echo "Invalid or missing packageManager in package.json: ${PACKAGE_MANAGER}" >&2; \
         exit 1; \
       fi \
    && pnpm install --prod --frozen-lockfile \
    && pnpm store prune \
    && yarn --version \
    && rm -rf /root/.npm /root/.cache

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
    io.hass.type="addon" \
    io.hass.version="${BUILD_VERSION}" \
    maintainer="Ruishiro" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="Home Assistant Community Add-ons" \
    org.opencontainers.image.authors="Ruishiro" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://addons.community" \
    org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
    org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/main/README.md" \
    org.opencontainers.image.created="${BUILD_DATE}" \
    org.opencontainers.image.revision="${BUILD_REF}" \
    org.opencontainers.image.version="${BUILD_VERSION}"
