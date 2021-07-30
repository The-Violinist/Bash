#! /bin/bash

#Demonstrates printing the output of an OS command to a txt file.
command=$(ip a)
echo $command > test.txt
