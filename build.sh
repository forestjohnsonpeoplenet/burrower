#!/bin/sh

docker build \
     -t forestjohnsonpeoplenet/burrower-build:0.2.1 \
     -f Dockerfile.build .
