#!/usr/bin/env bash

CONTAINER=$1-${NODE_ENV}

CONTAINER_ID=$(docker ps -a|grep ${CONTAINER}|awk '{print $1}')
IMAGE_TAG=$(docker ps -a|grep ${CONTAINER}|awk '{print $2}')
IMAGE_ID=$(docker images|grep ${IMAGE_TAG%%:latest}|awk '{print $3}')

if [ "$CONTAINER_ID" != '' ]; then
  echo "Remove Container: "$CONTAINER_ID
  docker stop $CONTAINER_ID
  docker rm $CONTAINER_ID
fi

if [ "$IMAGE_ID" != '' ]; then
  echo "Remove Image: "$IMAGE_ID
  docker rmi $IMAGE_ID
fi