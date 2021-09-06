#!/bin/bash

set -ex

PARENT_DIR=$(basename "${PWD%/*}")
CURRENT_DIR="${PWD##*/}"
IMAGE_NAME="$PARENT_DIR/$CURRENT_DIR"
#TAG="${1}"

REGISTRY="ghcr.io"

docker build -t ${REGISTRY}/${IMAGE_NAME}:latest .

echo ${{ secrets.PACKAGES_TOKEN }} | docker login --username ${{ secrets.DOCKER_USERNAME }} --password-stdin ${REGISTRY}

docker push ${REGISTRY}/${IMAGE_NAME}
