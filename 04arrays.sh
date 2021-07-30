#! /bin/bash

#VARIABLES
i=1
dir=dir
dirs=()
location=$(pwd)
#FUNCTIONS

#Loop for creating x number of new directories
#After creating the directory, the directory path is added to an array named dirs.
makedirs (){
until [ $i -gt 4 ]
do
    dir_name=$dir$i
    mkdir $dir_name
    dirs+=($location"/"$dir_name)
    ((i++))
done
}

#This function creates a new text file in each of the new directories.
#Accomplished by iterating over the directory array created in the makedirs function.
create_files (){
for dir in ${dirs[@]}
do
    echo "Creating a file in directory "$dir
    touch $dir/test.txt
done
}

#MAIN
makedirs
create_files

sleep 5
iter=1
dir=dir

until [ $iter -gt 4 ]
do
    rm -rf $dir$iter
    ((iter++))
done
#END
