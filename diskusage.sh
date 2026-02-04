#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=6
MESSAGE=

while IFS= read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1 )
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MESSAGE+=echo "$FOLDER is more then $DISK_THRESHOLD, current usage: $USAGE \n"
    fi

done <<< $DISK_USAGE
    echo -e "message: $MESSAGE"

echo "$MESSAGE" | mail -s "Disk usage alert" srinivasrdy1011@gmail.com


   