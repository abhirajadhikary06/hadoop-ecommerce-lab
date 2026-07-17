#!/bin/bash

docker exec kafka \
kafka-consumer-groups.sh \
--bootstrap-server localhost:9092 \
--list

echo

docker exec kafka \
kafka-consumer-groups.sh \
--bootstrap-server localhost:9092 \
--describe \
--group clickstream-group