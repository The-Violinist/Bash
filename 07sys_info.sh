#!/bin/bash

#David Armstrong
#Uses lshw to write system information to a log file about selected components.

###VARIABLES###
#Request root password from user
read -s -p "Please enter your password"$'\n' pass

#Array for the system components to lookup
sys_info=(processor memory network display)

###VARIABLES###
ask_user(){
read -p "Would you like to record data about the $x?"$'\n' yes_no
}

sys_lookup(){
for x in ${sys_info[@]}
do
    ask_user
    if [ $yes_no == yes ]
    then
        echo $x information >> system_info.txt
        echo $pass | sudo -S lshw -class $x >> system_info.txt
        echo $'\n\n\n' >> system_info.txt
    else
        continue
    fi
done
}

###MAIN###
sys_lookup
###END###