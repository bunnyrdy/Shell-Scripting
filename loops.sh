#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "please run as root user"
    exit 1
else
    echo "you are root user, proceed with installations"
fi  

for i in $@
do
    echo "package to install: $i"
done
 