#!/bin/bash

echo
echo "========== Containers =========="
docker ps | grep flume

echo
echo "========== HDFS =========="
docker exec namenode hdfs dfs -ls /bronze/logs/flume

echo
echo "========== Data =========="
docker exec namenode hdfs dfs -text /bronze/logs/flume/*