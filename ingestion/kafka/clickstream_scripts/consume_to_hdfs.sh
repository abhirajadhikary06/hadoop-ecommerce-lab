#!/bin/bash

mkdir -p ingestion/kafka/hdfs

docker exec kafka \
kafka-console-consumer.sh \
--bootstrap-server localhost:9092 \
--topic clickstream \
--from-beginning \
--timeout-ms 5000 \
> ingestion/kafka/hdfs/clickstream_data.json

docker cp ingestion/kafka/hdfs/clickstream_data.json \
namenode:/tmp/clickstream_data.json

docker exec namenode hdfs dfs -mkdir -p /bronze/clickstream

docker exec namenode \
hdfs dfs -put -f /tmp/clickstream_data.json /bronze/clickstream/