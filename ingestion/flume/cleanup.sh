#!/bin/bash

docker exec namenode hdfs dfs -rm -r -f /bronze/logs/flume

rm -f ingestion/flume/logs/application.log

echo "Cleanup Complete"