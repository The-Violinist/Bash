#!/bin/bash

# Author: David Armstrong
# Date of latest revision: 08-02-2021
# Purpose: Kill processes using user input

###FUNCTIONS###
#Ask if the user would like to stop a process.
ask_user (){
read -p "Would you like to kill a process?"$'\n' yes_no
}

#Ask if the user would like to stop a process.
ask_again (){
read -p "Would you like to kill another process?"$'\n' yes_no_again
}

#Loop to stop processes
kill_process (){
while true
do
    read -p "Please enter a PID number to end a process"$'\n' pid_num
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
