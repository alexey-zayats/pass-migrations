#!/usr/bin/env bash

REALPATH=`realpath $0`
DIRPATH=`dirname $REALPATH`

REGISTRY_URL=dockereg.athletic.cloud
VERSION=$(cat VERSION)
IMAGE=${REGISTRY_URL}/pass-migrations

docker build -t ${IMAGE} .
docker tag ${IMAGE}:latest ${IMAGE}:${VERSION}

# docker push ${IMAGE}:${VERSION}
# docker push ${IMAGE}:latest
