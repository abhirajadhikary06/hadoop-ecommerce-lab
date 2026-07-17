#!/bin/bash

docker exec kafka kafka-topics.sh \
--bootstrap-server localhost:9092 \
--create \
--topic ecommerce-orders \
--partitions 3 \
--replication-factor 1

echo "Topic Created"