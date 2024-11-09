FROM quay.io/jupyter/base-notebook:aarch64-latest

USER root
RUN set -ex; \
    apt-get update --yes; \
    apt-get install --yes --no-install-recommends \
      ca-certificates \
      libusb-1.0.0 \
      rtl-sdr \
      librtlsdr-dev \
      rtl-433 \
      usbutils; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

RUN usermod -aG plugdev ${NB_USER}

USER ${NB_UID}
