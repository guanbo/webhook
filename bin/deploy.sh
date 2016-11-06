#!/usr/bin/env bash

cd $(dirname $0)

APP=$1
TAG=$2

# cleanup
cleanup.sh ${APP}

# login docker hub
docker login --username=${DOCKER_UERNAME} --password=${DOCKER_PASSWORD} ${REGISTRY}

# start container
../apps/${APP}/startup.sh $TAG