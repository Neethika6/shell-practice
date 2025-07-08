#!/bin/bash
threshold=10
while read i
do
    disk_usage=$(df -h | grep $i | awk '{print $5}'| cut -d "%" -f1 | awk NR==1)
    if [ $disk_usage -ge $threshold ]  
    then
        echo "$i is $disk_usage"
    fi
done < monitor.config

