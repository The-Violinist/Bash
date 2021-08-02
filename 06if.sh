#!/bin/bash
# list, one loop, and one conditional

###VARIABLES###
files=()
i=1
###FUNCTIONS###
#How many files to search for.
how_many (){
read -p "How many files would you like to seach for?" num_files
}

#Enter files to search for.
enter_files (){
until [ $i -gt $num_files ]
do
    echo Please enter a file path:
    read new_file
    files+=($new_file)
    ((i++))
done
}

#Find and/or create files.
find_files (){
for each_file in ${files[@]}
do
    if [ ! -f $each_file ]
    then
        echo $each_file not found!
        echo Creating $each_file...
        create_file
    else
        echo $each_file already exists.$'\n'
    fi
done
}

create_file (){
touch $each_file
echo "The file has been created"$'\n'
}

###MAIN###
how_many
enter_files
find_files