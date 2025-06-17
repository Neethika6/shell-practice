#!/bin/bash

echo "All variables passed to the script:$@"
echo "Number of variable passed to the script:$#"
echo "Name of the scipt:$0"
echo "Present working directory:$PWD"
echo "Which user is running the script:$USER"
echo "Home directory of the user running the script:$HOME"
echo "PID of the current running script:$$"
sleep 10 &
echo "PID of the last command running in the background:$!"

name=$1
echo $name