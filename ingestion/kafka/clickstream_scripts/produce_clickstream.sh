#!/bin/bash

docker exec -i kafka \
kafka-console-producer.sh \
--bootstrap-server localhost:9092 \
--topic clickstream \
< ingestion/kafka/data/clickstream_data.json