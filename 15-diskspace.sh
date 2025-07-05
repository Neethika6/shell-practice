#!/bin/bash
set -x
threshold=1
while read i
do
    disk_usage=$(df -h | awk '$6 == "$i" {print $5}' | cut -d "%" -f1)
    if [ $disk_usage >= 1 ] 
    then
        echo "$i is $disk_uage"
    fi
done < monitor.config

