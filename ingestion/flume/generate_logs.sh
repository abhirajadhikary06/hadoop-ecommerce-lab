#!/bin/bash

LOGFILE=ingestion/flume/logs/application_temp.log

mkdir -p ingestion/flume/logs

touch "$LOGFILE"

while true
do
    echo "$(date) INFO User Login Successful" >> "$LOGFILE"
    sleep 5
done