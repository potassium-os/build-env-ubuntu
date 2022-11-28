# syntax=docker/dockerfile:1

FROM docker.io/ubuntu:kinetic

USER root

RUN set -exu \
  && mkdir -p /opt/workdir \
  && apt-get -yq update \
  && apt-get -yq install \
    debootstrap \
    rsync \
    wget \
    git \
    curl

WORKDIR /opt/workdir

CMD /bin/bash
