#!/usr/bin/env bash

cd $(dirname $0)

APP=$1
TAG=$2
SCR_TAG="latest"
if [ -n "$3" ]; then
  TAG=$3
fi

IMAGE=${REGISTRY}/${DOCKER_USER}/${APP}

# login docker hub
docker login --username=${DOCKER_USERNAME} --password=${DOCKER_PASSWORD} ${REGISTRY}

# push image
docker tag ${IMAGE}:${SCR_TAG} ${IMAGE}:${TAG}
docker push ${IMAGE}:${TAG}

# cleanup tag
docker rmi ${IMAGE}:${TAG}