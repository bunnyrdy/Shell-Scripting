USERID=$(id -u)

VALIDATE(){
    echo "exit status: $?"
    echo "what are you doing: $2"
}

if [ "$USERID" -ne 0 ]
then 
echo "Please run as root"
else
    echo "You are root user, proceed with installations"
fi

dnf install mysql -y
VALIDATE $? "Installing mysql"
dnf install git -y
VALIDATE $? "Installing git"