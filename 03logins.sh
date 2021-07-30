#! /bin/bash

#Declare a variable with the value of recent logins.
#VARIABLES
logins=$(last)

#Function to echo the login history.
#FUNCTIONS
history (){
echo $logins
}

history

#END
