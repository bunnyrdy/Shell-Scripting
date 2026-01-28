#!bin/bash

# This script demonstrates conditional statements in shell scripting
NUMBER = $1

if [ $NUMBER -gt 5 ]
then 
echo "the number is greater than 5"
else
echo "the number is less than or equal to 5"
fi