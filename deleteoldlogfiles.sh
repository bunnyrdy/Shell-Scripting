#!/bin/bash

SOURCE_DIRECTORY=/tmp/app-logs
R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m"
N="\e[0m"

if [ -d $SOURCE_DIRECTORY ]
then
 echo "$G source directory exists $N"
else
 echo "$R PLEASE MAKE SURE $SOURCE_DIRECTORY EXISTS $N"
 exit 1
fi

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +2)


