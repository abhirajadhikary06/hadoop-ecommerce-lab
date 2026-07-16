#!/bin/bash

set -e

TMP=/tmp/payment_analysis.csv
CMDS=/tmp/payment_analysis.hbase

docker exec namenode bash -c \
"hdfs dfs -cat /gold/orders/payment_analysis/part-* > $TMP"

docker cp namenode:$TMP ./payment_analysis.csv

rm -f "$CMDS"

while IFS=',' read -r payment count revenue
do
cat >> "$CMDS" <<EOF
put 'payment_analysis','$payment','info:orders','$count'
put 'payment_analysis','$payment','info:revenue','$revenue'
EOF
done < payment_analysis.csv

docker cp "$CMDS" hbase:/tmp/payment_analysis.hbase

docker exec hbase hbase shell /tmp/payment_analysis.hbase

rm -f payment_analysis.csv
rm -f "$CMDS"

docker exec namenode rm -f "$TMP"
docker exec hbase rm -f /tmp/payment_analysis.hbase

echo "Payment Analysis Loaded"