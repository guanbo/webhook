#!/usr/bin/env bash

cd $(dirname $0)

APP=$1
TAG=$2
IMAGE=${REGISTRY}/${DOCKER_USER}/${APP}

# login docker hub
docker login --username=${DOCKER_USERNAME} --password=${DOCKER_PASSWORD} ${REGISTRY}

# push image
docker tag ${IMAGE}:latest ${IMAGE}:${TAG}
docker push ${IMAGE}:${TAG}

# cleanup tag
docker rmi ${IMAGE}:${TAG}