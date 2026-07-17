#!/bin/bash

docker compose \
-f infrastructure/docker/docker-compose.kafka.yml \
down

echo
echo "==================================="
echo "Kafka Stopped"
echo "==================================="