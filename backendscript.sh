#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[0;31m"
G="\e[0;32m"
Y="\e[0;33m"
N="\e[0m"

VALIDATE(){
    
    if [ $1 -ne 0 ]
    then
         echo -e "$2.....$R FAILURE $N"
         exit 1
    else
        echo -e "$2.....$G SUCCESS $N"
    fi
    
}

dnf module disable nodejs -y &>>$LOGFILE
    VALIDATE $? "module node js disabled"

dnf module enable nodejs:20 -y &>>$LOGFILE
     VALIDATE $? "module node js: 20 enabled"


dnf install nodejs -y &>>$LOGFILE
    VALIDATE $? "nodejs:20 unstalled"

id expense
if [ $? -ne 0 ]
then
    adduser expense
    VALIDATE $? "creating user expense "
else
    echo "user already present"
fi

mkdir -p /app
VALIDATE $? "creating app directory"

 curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip
 VALIDATE $? "downloading the code"

cd /app
npm install &>>$LOGFILE
VALIDATE $? "installing dependancies"

cp /home/ec2-user/Shell-Scripting/backend.service /etc/systemd/system/backend.service
VALIDATE $? "copied backend service"





