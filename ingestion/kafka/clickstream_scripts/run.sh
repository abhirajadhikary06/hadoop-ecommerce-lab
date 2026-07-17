#!/bin/bash

set -e

echo
echo "======================================"
echo "Kafka Clickstream Practical"
echo "======================================"

echo
echo "[1/5] Starting Kafka..."
bash ingestion/kafka/clickstream_scripts/start.sh

sleep 5

echo
echo "[2/5] Creating Clickstream Topic..."
bash ingestion/kafka/clickstream_scripts/create_topics.sh

echo
echo "[3/5] Topic Information..."
bash ingestion/kafka/clickstream_scripts/topic_info.sh

echo
echo "[4/5] Kafka Status..."
bash ingestion/kafka/clickstream_scripts/status.sh

echo
echo "======================================"
echo "Setup Complete"
echo "======================================"

echo
echo "Next Commands"

echo
echo "# Terminal 1"
echo "bash ingestion/kafka/clickstream_scripts/consume_clickstream.sh"

echo
echo "# Terminal 2"
echo "bash ingestion/kafka/clickstream_scripts/produce_clickstream.sh"

echo
echo "# Load into HDFS"
echo "bash ingestion/kafka/clickstream_scripts/consume_to_hdfs.sh"