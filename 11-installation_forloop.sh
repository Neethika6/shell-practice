#!/bin/bash

#Check if you are running the script as a ROOT User or not

PACKAGE_ARRAY=("mysql" "nginx" "httpd" "python3")
#Below are the format for color codes 31->RED, 32->Green, 33->Yellow
#echo -e (-e enabled color)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
user_id=$(id -u)

if [ $user_id -eq 0 ]
then
    echo -e "$G SUCCESS:You are running the script as ROOT"
else
    echo -e "$R ERROR:: You are running the script as NON-ROOT.Please Switch to ROOT"
    exit 1
fi

#FUNCTION TO VALIDATE INSTLLATION

INSTALLATION_VALIDATION()
{
    if [ $1 -eq 0 ]
    then
        echo -e "$G SUCCESS:$2 Instllation is success"
    else
        echo -e "$R ERROR::$2 Installation Failed"
    fi 
}

#FOR LOOP

for package in ${PACKAGE_ARRAY[@]}
do
dnf list installed $package -y #Check of the nginx is already installed or not
    if [ $? -ne 0 ] #$? values returns 0 if the statement which was last executed is success if not it will return 1 to 127
    then
        echo -e "$Y Proceed with $package installation"
        dnf install $package
        INSTALLATION_VALIDATION $? "$package"
    else
        echo -e "$Y $package is already installed"
    fi
done



