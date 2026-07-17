#!/bin/bash

docker exec kafka \
kafka-consumer-groups.sh \
--bootstrap-server localhost:9092 \
--group demo-group \
--describe