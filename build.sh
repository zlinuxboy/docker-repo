#!/bin/bash

set -ex

PARENT_DIR=$(basename "${PWD%/*}")
CURRENT_DIR="${PWD##*/}"
#IMAGE_NAME="$PARENT_DIR/$CURRENT_DIR"
IMAGE_NAME="$CURRENT_DIR"
#TAG="${1}"

#REGISTRY="ghcr.io"
REGISTRY=""
docker buildx build --platform linux/amd64,linux/arm64,linux/armv7 -t zouyq/${IMAGE_NAME}:latest .
docker push zouyq/${IMAGE_NAME}
