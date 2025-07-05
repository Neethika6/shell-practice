#!/bin/bash
set -x
threshold=1
while read i
do
    if [ $disk_usage -ge 1 ] 
    then
        disk_usage=$(df -h | awk '$6 == "$i" {print $5}' | cut -d "%" -f1)
        echo "$i is $disk_uage"
    fi
done < monitor.config

