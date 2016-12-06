#!/usr/bin/env bash

cd $(dirname $0)

APP=$1
TAG=$2
SRC_TAG="latest"
if [ -n "$3" ]; then
  SRC_TAG=$3
fi

IMAGE=${REGISTRY}/${DOCKER_USER}/${APP}

# login docker hub
docker login --username=${DOCKER_USERNAME} --password=${DOCKER_PASSWORD} ${REGISTRY}

# push image
docker tag ${IMAGE}:${SRC_TAG} ${IMAGE}:${TAG}
docker push ${IMAGE}:${TAG}

# cleanup tag
docker rmi ${IMAGE}:${TAG}