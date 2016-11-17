#!/bin/sh

CURRENT_DIR=$(pwd)

docker run -d --name burrower-build-artifact \
    -v "$CURRENT_DIR/artifact:/burrower/target/scala-2.11:rw" \
    --entrypoint sleep \
    forestjohnsonpeoplenet/burrower-build:0.2.1 \
    1000

docker build \
  -t forestjohnsonpeoplenet/burrower:0.2.1 \
  -f Dockerfile.runtime .

docker kill burrower-build-artifact

docker rm burrower-build-artifact
