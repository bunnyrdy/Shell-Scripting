#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
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
        echo -e "$2....$G SUCCESS $N"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "please run the script in root access."
    exit 1
else
    echo "you are root user"
fi

dnf list installed | grep -i mysql &>>LOGFILE

if [ $? -eq 0 ]
 then 
    echo "mysql already installed"
else
    dnf install mysql-server -y &>>$LOGFILE
    VALIDATE $? "INSTALLING MYSQL SERVER"
fi

    systemctl enable mysqld &>>$LOGFILE
    VALIDATE $? "enabled mysql"

    systemctl start mysqld &>>$LOGFILE
    VALIDATE $? "started mysql"

    


