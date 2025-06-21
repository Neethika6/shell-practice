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

if [ $? -ne 0 ]
then
    echo "Proceed with nhinx installation"
    dnf install nginfasx
    if [ $? -eq 0 ]
    then
        echo "Instllation is success"
    else
        echo "Installation Failed"
        exit 1
    fi 
else
    echo "NGINX is already installed"
fi
