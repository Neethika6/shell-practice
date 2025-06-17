#!/bin/bash

#In this we are going to install MYSQL
# Installation can be done with the root
# id -u this value will be 0 fro root user

id_value=$(id -u)
if [ $id_value -eq 0 ]
then
    echo "You are in ROOT..You can proceed with installation"
else
    echo "ERROR:Please switch to ROOT"
    exit 1
fi

#check if the package is already installed or not
# dnf list installed mysql

# if [ ]
# then
# else
# fi

#Steps to install the package
dnf install mysqlkjkjfa
if [ $? -eq 0 ]
then 
    echo "MySQL installation is success"
else
    echo "MySQL installation failed"
    exit 1
fi


