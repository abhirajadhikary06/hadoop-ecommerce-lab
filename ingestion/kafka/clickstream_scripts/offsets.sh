#!/bin/bash

docker exec kafka \
kafka-run-class.sh kafka.tools.GetOffsetShell \
--broker-list localhost:9092 \
--topic clickstream