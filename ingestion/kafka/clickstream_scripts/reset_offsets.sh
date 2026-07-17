#!/bin/bash

docker exec kafka \
kafka-consumer-groups.sh \
--bootstrap-server localhost:9092 \
--group clickstream-group \
--topic clickstream \
--reset-offsets \
--to-earliest \
--execute