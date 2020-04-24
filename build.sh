#!/usr/bin/env bash

REALPATH=`realpath $0`
DIRPATH=`dirname $REALPATH`

REGISTRY_URL=aazayats
IMAGE=${REGISTRY_URL}/claim-migrations
VERSION=$(cat VERSION)

docker build -t ${IMAGE} .
docker tag ${IMAGE}:latest ${IMAGE}:${VERSION}

docker push ${IMAGE}:${VERSION}
docker push ${IMAGE}:latest
