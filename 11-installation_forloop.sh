#!/bin/bash

#Check if you are running the script as a ROOT User or not

user_id=$(id -u)

if [ $user_id -eq 0 ]
then
    echo "You are running the script as ROOT"
else
    echo "ERROR:: You are running the script as NON-ROOT.Please Switch to ROOT"
    exit 1
fi

dnf list installed nginx