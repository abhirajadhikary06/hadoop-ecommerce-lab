#!/bin/bash

set -e

echo
echo "========================================"
echo "Starting Kafka"
echo "========================================"

./ingestion/kafka/start_kafka.sh

sleep 8

echo
echo "========================================"
echo "Verifying Kafka"
echo "========================================"

./ingestion/kafka/verify_kafka.sh

echo
echo "========================================"
echo "Creating Topic"
echo "========================================"

./ingestion/kafka/create_topics.sh

echo
echo "========================================"
echo "Available Topics"
echo "========================================"

./ingestion/kafka/list_topics.sh

echo
echo "========================================"
echo "Kafka Setup Completed"
echo "========================================"