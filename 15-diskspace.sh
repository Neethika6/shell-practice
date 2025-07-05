#!/bin/bash
set -x
threshold=1
disk_usage=$(df -h | awk 'NR>1 {print $5}' | cut -d "%" -f1)
while read i
do
    if [ $disk_usage -ge 1 ] 
    then
        echo "$i is $disk_uage"
    fi
done < monitor.config

