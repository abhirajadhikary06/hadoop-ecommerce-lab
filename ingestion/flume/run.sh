#!/bin/bash

set -e

echo
echo "======================================"
echo "Starting Flume Container"
echo "======================================"

./ingestion/flume/start_flume.sh

sleep 5

echo
echo "======================================"
echo "Loading Demo Data"
echo "======================================"

./ingestion/flume/load_demo_data.sh

sleep 10

echo
echo "======================================"
echo "Verifying HDFS"
echo "======================================"

./ingestion/flume/verify_flume.sh

echo
echo "======================================"
echo "Demo Completed"
echo "======================================"