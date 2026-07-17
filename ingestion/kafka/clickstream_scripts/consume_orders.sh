#!/bin/bash

docker exec -it kafka \
kafka-console-consumer.sh \
--bootstrap-server localhost:9092 \
--topic customer-orders \
--from-beginning \
--property print.key=true \
--property print.partition=true