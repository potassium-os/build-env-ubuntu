#!/usr/bin/env bash

set -exu

# where this .sh file lives
DIRNAME=$(dirname "$0")
SCRIPT_DIR=$(cd "$DIRNAME" || exit; pwd)
cd "$SCRIPT_DIR" || exit

CONTAINER_NAME="ghcr.io/potassium-os/debootstrap-ubuntu"
BUILD_TIME=$(date '+%F-%H%M')
OUTPUT_TAG="${OUTPUT_TAG:-$BUILD_TIME}"

time docker build --tag "${CONTAINER_NAME}:${OUTPUT_TAG}" .
