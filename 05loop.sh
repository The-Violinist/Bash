#!/bin/bash

# Script:
# Author:
# Date of latest revision:
# Purpose:

###FUNCTIONS###
#Ask is the user would like to stop a process.
ask_user (){
echo Would you like to kill a process?
read yes_no
}

#Ask is the user would like to stop a process.
ask_again (){
echo Would you like to kill another process?
read yes_no_again
}

#Loop to stop processes
kill_process (){
while true
do
    echo Please enter a PID number to end a process
    read pid_num
    kill $pid_num
    ask_again
    if [ $yes_no_again == no ]
    then
        exit
    elif [ $yes_no_again == yes ]
    then
        ps -aux
    fi
done
}


#MAIN
ps -aux
ask_user
if [ $yes_no == yes ]
then
    kill_process
else
    echo Ok, I will not end any processes
fi
# End
