#!/bin/bash

echo
echo "========== Kafka Container =========="
docker ps | grep kafka

echo
echo "========== Kafka Topics =========="
docker exec kafka \
kafka-topics.sh \
--bootstrap-server localhost:9092 \
--list

echo
echo "========== Clickstream Topic =========="
docker exec kafka \
kafka-topics.sh \
--bootstrap-server localhost:9092 \
--describe \
--topic clickstream

echo
echo "========== Consumer Groups =========="
docker exec kafka \
kafka-consumer-groups.sh \
--bootstrap-server localhost:9092 \
--list

echo
echo "========== Topic Offsets =========="
docker exec kafka \
kafka-run-class.sh kafka.tools.GetOffsetShell \
--broker-list localhost:9092 \
--topic clickstream

echo
echo "========== HDFS =========="
docker exec namenode \
hdfs dfs -ls /bronze/clickstream 2>/dev/null || echo "No data in HDFS yet"