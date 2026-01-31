#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(edate +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d. -f1)
LOG_FILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[0;31m"
G="\e[0;32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 ...FAILURE
        exit 1
    else
        echo "$2 ...SUCCESS
    fi
}

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
    dnf list installed $i &>>$LOG_FILE
    if [ $? -eq 0 ]
    then
        echo "already installed ... skipping"
    else
       dnf install $i -y &>>$LOG_FILE
       VALIDATE $? "installion of $i"
    fi

done
 