#!/bin/bash

set -ex

PARENT_DIR=$(basename "${PWD%/*}")
CURRENT_DIR="${PWD##*/}"
IMAGE_NAME="$PARENT_DIR/$CURRENT_DIR"
#TAG="${1}"

#REGISTRY="ghcr.io"
REGISTRY=""
docker build -t ${IMAGE_NAME}:latest .
docker push ${REGISTRY}/${IMAGE_NAME}
