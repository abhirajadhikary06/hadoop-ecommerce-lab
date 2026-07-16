#!/bin/bash
set -e

echo "========================================"
echo "Starting Apache HBase"
echo "========================================"

echo "Waiting for HDFS..."

until nc -z namenode 9000
do
    sleep 2
done

echo "HDFS is available."

mkdir -p /opt/hbase/zookeeper
mkdir -p /opt/hbase/tmp

echo "Formatting HBase root directory if needed..."

hdfs dfs -mkdir -p /hbase || true

echo "Starting HBase..."

$HBASE_HOME/bin/start-hbase.sh

echo
echo "Running Java Processes:"
jps

echo
echo "HBase started successfully."

tail -f $HBASE_HOME/logs/*