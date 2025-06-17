#!/bin/bash

#We are going to install mutliple packages with the help of functions
#Let's install MySQL, NGINX and python3

# To install any package validate if you are in ROOT

id_value=$(id -u)
if [ $id_value -eq 0 ]
then
    echo "SUCCESS::YOU are in ROOT"
else
    echo "ERROR: Please switch to root"
fi

#Functions are used when we are doing the repetitive tasks
#As per 09-installation.sh script we can see installation process is repetivtive

PACKAGE_INSTALLATION()
{
    #Steps to install the package
    dnf install $1 -y
    if [ $? -eq 0 ]
    then 
        echo "SUCCESS:$1 installation is done"
    else
        echo "ERROR:$1 installation failed"
        exit 1
    fi
}

#check if the package is already installed or not
dnf list installed $1

if [ $? -ne 0 ]
then
    echo "SUCCESS: Procced with installation"
    PACKAGE_INSTALLATION(mysql)
    
else
    echo "Package is already installed"
fi

