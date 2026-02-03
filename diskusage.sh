#!/bin/bash

DISK_USAGE=$(DF -hT | grep xfs)
DISK_THRESHOLD=6

while IFS= read -r line
do
    USAGE=$(echo $line | awk -F " " '{print$6F}' | cut -d "%" -f1 )
    FOLDER=$(echo $line | awk -F " " '{print$NF})')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        echo "$FOLDER is more then $DISK_THRESHOLD, current usage: $USAGE"
    fi

done <<< $DISK_USAGE