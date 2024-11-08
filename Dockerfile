FROM --platform=linux/arm64 quay.io/jupyterhub/k8s-singleuser-sample:4.0.0

USER root
RUN set -ex; \
    apt-get -y update; \
    apt-get install --no-install-recommends --no-install-suggests -y \
      ca-certificates \
      libusb-1.0.0 \
      rtl-sdr \
      rtl-433 \
      usbutils; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

RUN usermod -aG plugdev jovyan

USER ${NB_UID}
