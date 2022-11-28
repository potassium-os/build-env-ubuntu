# syntax=docker/dockerfile:1

FROM docker.io/ubuntu:kinetic

USER root

RUN set -exu \
  && mkdir -p /opt/workdir \
  && apt-get -yq update \
  && apt-get -yq install \
    debootstrap \
    binfmt-support \
    rsync \
    wget \
    git \
    curl \
    build-essential \
    libarchive-tools \
    git \
    curl \
    wget \
    f2fs-tools \
    cgpt \
    vboot-utils \
    libncurses-dev \
    gawk \
    flex \
    bison \
    openssl \
    libssl-dev \
    dkms \
    libelf-dev \
    libudev-dev \
    libpci-dev \
    libiberty-dev \
    autoconf \
    qemu-user-static \
    gcc-aarch64-linux-gnu \
    binutils-aarch64-linux-gnu \
    vboot-utils \
    u-boot-tools \
    swig \
    python3-dev \
    python3-distutils \
    gcc-aarch64-linux-gnu \
    gcc-arm-none-eabi \
    libarchive-tools \
    debootstrap \
    parted \
    bc \
    lz4 \
    bash \
    sudo

RUN set -exu \
  && groupadd --gid 1000 builder \
  && useradd --uid 1000 --gid builder --shell /bin/bash builder \
  && usermod -a -G sudo builder \
  && echo 'builder ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER builder

WORKDIR /opt/workdir

CMD /bin/bash
