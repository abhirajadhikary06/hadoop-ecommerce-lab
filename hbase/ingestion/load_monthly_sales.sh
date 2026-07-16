#!/bin/bash

set -e

TMP=/tmp/monthly_sales.csv
CMDS=/tmp/monthly_sales.hbase

docker exec namenode bash -c \
"hdfs dfs -cat /gold/orders/monthly_sales/part-* > $TMP"

docker cp namenode:$TMP ./monthly_sales.csv

rm -f "$CMDS"

while IFS=',' read -r month revenue
do
cat >> "$CMDS" <<EOF
put 'monthly_sales','$month','info:revenue','$revenue'
EOF
done < monthly_sales.csv

docker cp "$CMDS" hbase:/tmp/monthly_sales.hbase

docker exec hbase hbase shell /tmp/monthly_sales.hbase

rm -f monthly_sales.csv
rm -f "$CMDS"

docker exec namenode rm -f "$TMP"
docker exec hbase rm -f /tmp/monthly_sales.hbase

echo "Monthly Sales Loaded"