#!/bin/bash

#In this we are going to install MYSQL
# Installation can be done with the root
# id -u this value will be 0 fro root user

id_value=$(id -u)
if [ $id_value -eq 0 ]
then
    echo "SUCCESS:You are in ROOT..You can proceed with installation"
else
    echo "ERROR:Please switch to ROOT"
    exit 1
fi

#check if the package is already installed or not
dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "SUCCESS: Procced with installation"
else
    echo "Package is already installed"
fi

#Steps to install the package
dnf install mysqlkjkjfa
if [ $? -eq 0 ]
then 
    echo "SUCCESS:MySQL installation is done"
else
    echo "ERROR:MySQL installation failed"
    exit 1
fi


