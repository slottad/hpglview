#!/bin/bash

USERNAME=slottad
IMAGE=hpglview
VERSION=5.43

docker build --build-arg version=${VERSION} -t $USERNAME/$IMAGE:$VERSION .
docker tag $USERNAME/$IMAGE:$VERSION $USERNAME/$IMAGE:latest
