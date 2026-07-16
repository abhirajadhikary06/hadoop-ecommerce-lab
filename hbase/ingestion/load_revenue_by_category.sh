#!/bin/bash

set -e

TMP=/tmp/revenue_by_category.csv
CMDS=/tmp/revenue_by_category.hbase

docker exec namenode bash -c \
"hdfs dfs -cat /gold/orders/revenue_by_category/part-* > $TMP"

docker cp namenode:$TMP ./revenue_by_category.csv

rm -f "$CMDS"

while IFS=',' read -r category revenue quantity orders
do
cat >> "$CMDS" <<EOF
put 'revenue_by_category','$category','info:revenue','$revenue'
put 'revenue_by_category','$category','info:quantity','$quantity'
put 'revenue_by_category','$category','info:orders','$orders'
EOF
done < revenue_by_category.csv

docker cp "$CMDS" hbase:/tmp/revenue_by_category.hbase

docker exec hbase hbase shell /tmp/revenue_by_category.hbase

rm -f revenue_by_category.csv
rm -f "$CMDS"

docker exec namenode rm -f "$TMP"
docker exec hbase rm -f /tmp/revenue_by_category.hbase

echo "Revenue By Category Loaded"