#!/bin/bash

#Check if you are running the script as a ROOT User or not

#Below are the format for color codes 31->RED, 32->Green, 33->Yellow
#echo -e (-e enabled color)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
user_id=$(id -u)
log_path=/var/log/shellscript_logs
time_script=$(date)

mkdir -p $log_path #if the directroy is already created it will not throw error if we use -p along with mkidr
script_name=$($0 | cut -d "." -f1)
log_file="$log_path/$script_name.log"

#tee command will show the log on screen and will save the log in the file as well

echo "SCRIPT STARTED AT $time_script" | tee -a $log_file
echo $log_file | tee - a $log_file

if [ $user_id -eq 0 ]
then
    echo -e "$G SUCCESS:You are running the script as ROOT" | tee -a $log_file
else
    echo -e "$R ERROR:: You are running the script as NON-ROOT.Please Switch to ROOT" | tee -a $log_file
    exit 1
fi

#FUNCTION TO VALIDATE INSTLLATION

INSTALLATION_VALIDATION()
{
    if [ $1 -eq 0 ]
    then
        echo -e "$G SUCCESS:$2 Instllation is success" | tee -a $log_file
    else
        echo -e "$R ERROR::$2 Installation Failed" | tee -a $log_file
    fi 
}

#FOR LOOP

for package in $@ #It will take the values from all the arguments that has been passed
do
dnf list installed $package & >> $log_file #Check of the nginx is already installed or not 
    if [ $? -ne 0 ] #$? values returns 0 if the statement which was last executed is success if not it will return 1 to 127
    then
        echo -e "$Y Proceed with $package installation" | tee -a $log_file
        dnf install $package -y & >> $log_file
        INSTALLATION_VALIDATION $? "$package"
    else
        echo -e "$Y $package is already installed" | tee -a $log_file
    fi
done