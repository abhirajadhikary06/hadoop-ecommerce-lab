#!/bin/bash

set -e

docker compose \
-f infrastructure/docker/docker-compose.kafka.yml \
up -d

echo
echo "==================================="
echo "Kafka Started Successfully"
echo "==================================="