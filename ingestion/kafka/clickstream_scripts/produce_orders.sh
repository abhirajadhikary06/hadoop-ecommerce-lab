#!/bin/bash

docker exec -it kafka \
kafka-console-producer.sh \
--bootstrap-server localhost:9092 \
--topic customer-orders \
--property parse.key=true \
--property key.separator=: