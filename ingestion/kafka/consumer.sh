#!/bin/bash

docker exec -it kafka \
kafka-console-consumer.sh \
--bootstrap-server localhost:9092 \
--topic ecommerce-orders \
--group demo-group