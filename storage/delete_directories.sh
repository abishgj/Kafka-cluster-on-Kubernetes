#!/bin/bash

#Author: Abish G J
#This script delete all the directories created suring deploying the infrastructure

#Assign the file name containing the directories list to a variable
CONFIG_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR_LIST_FILE="$CONFIG_PATH/directories_list.txt"

#Iterate through each directory and delete
while read -r directory
do
    if [ -d "$directory" ]; then
        rm -rf "$directory"
fi
done < $DIR_LIST_FILE

cp /dev/null $DIR_LIST_FILE

echo "All the directories are permanently deleted!!"
