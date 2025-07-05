#!/bin/bash

cd /var/log/source

logs_files=$(find . -name="*.log" -mtime +14)

while IFS= read lines
do 
    mv $lines /var/log/destination
    cd /var/log/destination
    gzip $lines
done <<< $logs_files
