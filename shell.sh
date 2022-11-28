#!/usr/bin/env bash

set -exu

# where this .sh file lives
DIRNAME=$(dirname "$0")
SCRIPT_DIR=$(cd "$DIRNAME" || exit; pwd)
cd "$SCRIPT_DIR" || exit

[ -z "$POTASSIUM_TOP_DIR" ] && echo "Need to set POTASSIUM_TOP_DIR variable" && exit 1;

BUILDENV_TAG="${BUILDENV_TAG:-"latest"}"

# get a shell inside the build env container, with your workdir mounted in.
docker run --rm -it \
    --volume "$POTASSIUM_TOP_DIR:/opt/workdir:rw" \
    ghcr.io/potassium-os/debootstrap-ubuntu:${BUILDENV_TAG} \
    /bin/bash
