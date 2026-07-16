#!/bin/bash

LOGFILE=ingestion/flume/logs/application_temp.log

mkdir -p ingestion/flume/logs

cat > "$LOGFILE" <<EOF
2026-07-16 10:00:01 INFO User Login Successful
2026-07-16 10:00:03 INFO Product Viewed
2026-07-16 10:00:05 INFO Product Added To Cart
2026-07-16 10:00:08 INFO Payment Initiated
2026-07-16 10:00:11 INFO Order Placed
EOF

echo "Demo data loaded."