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
   
    if [ $1 -eq 0 ]
    then 
        echo "SUCCESS:$2 installation is done"
    else
        echo "ERROR:$2 installation failed"
        exit 1
    fi
}

#check if the package is already installed or not
dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "SUCCESS: Procced with installation"
    dnf install mysql -y
    PACKAGE_INSTALLATION $? "MySQL"
    
else
    echo "Package is already installed"
fi

#Install NGINX

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo "SUCCESS: Proceed with installation"
    dnf install nginx -y
    PACKAGE_INSTALLATION $? "nginx"
else
    echo "Package is already installed"
fi

#INSTALL PYTHON3

dnf list istalled python3
if [ $? -ne 0 ]
then
    echo "SUCCESS: Proceed with installation"
    dnf install python3 -y
    PACKAGE_INSTALLATION $? "python3"
else
    echo "Package is already insatlled"
fi