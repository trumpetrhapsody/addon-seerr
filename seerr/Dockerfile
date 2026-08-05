ARG BUILD_FROM=ghcr.io/hassio-addons/base:18.2.1
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
ARG SEERR_VERSION=3.4.1
ENV COMMIT_TAG=v${SEERR_VERSION}

RUN \
  sed -i 's/=.*//g' /etc/apk/world \
  && apk fix --no-cache \
  && apk upgrade --no-cache \
  && apk add --no-cache \
        build-base \
        python3 \
        nodejs \
        npm \
        curl \
        tar \
    && npm install -g pnpm@10.24.0 yarn corepack \
    && corepack enable \
	&& corepack prepare pnpm@10.24.0 --activate \
  && curl -J -L -o /tmp/seerr.tar.gz \
      "https://github.com/seerr-team/seerr/archive/v${SEERR_VERSION}.tar.gz" \
  && tar zxvf \
      /tmp/seerr.tar.gz \
      --strip 1 -C /opt
	
# Copy root filesystem
COPY rootfs /
COPY run.sh /

RUN chmod a+x /run.sh
CMD [ "/run.sh" ]

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Ruishiro" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="Home Assistant Community Add-ons" \
    org.opencontainers.image.authors="Ruishiro" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://addons.community" \
    org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
    org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/main/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
