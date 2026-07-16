#!/bin/bash

set -e

TMP=/tmp/top_customers.csv
CMDS=/tmp/top_customers.hbase

docker exec namenode bash -c \
"hdfs dfs -cat /gold/orders/top_customers/part-* > $TMP"

docker cp namenode:$TMP ./top_customers.csv

rm -f "$CMDS"

while IFS=',' read -r id name orders revenue
do
cat >> "$CMDS" <<EOF
put 'top_customers','$id','info:name','$name'
put 'top_customers','$id','info:orders','$orders'
put 'top_customers','$id','info:revenue','$revenue'
EOF
done < top_customers.csv

docker cp "$CMDS" hbase:/tmp/top_customers.hbase

docker exec hbase hbase shell /tmp/top_customers.hbase

rm -f top_customers.csv
rm -f "$CMDS"

docker exec namenode rm -f "$TMP"
docker exec hbase rm -f /tmp/top_customers.hbase

echo "Top Customers Loaded"