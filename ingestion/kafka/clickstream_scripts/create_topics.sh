#!/bin/bash

docker exec kafka \
kafka-topics.sh \
--bootstrap-server localhost:9092 \
--create \
--topic clickstream \
--partitions 3 \
--replication-factor 1

echo
echo "Topic Created"