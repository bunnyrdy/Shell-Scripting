#!/bin/bash
# this script demonstrates installation of packages using apt-get

USERID=$(id -u)

if [ $USERID -ne 0]
then 
echo "Please run as root"]
if

dnf install mysql -y