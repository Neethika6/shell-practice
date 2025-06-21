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

INSTALLATION_VALIDATION()
{
    if [ $1 -eq 0 ]
    then
        echo "$2 Instllation is success"
    else
        echo "$2 Installation Failed"
        exit 1
    fi 
}

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "Proceed with nginx installation"
    dnf install nginfasx
    INSTALLATION_VALIDATION $? "nginx"
else
    echo "NGINX is already installed"
fi
