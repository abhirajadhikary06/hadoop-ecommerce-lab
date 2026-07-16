#!/bin/bash

set -e

docker compose \
-f infrastructure/docker/docker-compose.flume.yml \
up -d

echo
echo "=============================="
echo "Flume Started"
echo "=============================="