#!/bin/bash
read -p "Enter your path that clone repo (start with ~/): " folder_path
read -p "Enter your file name that contains the apache log file: " file_name

# set a cronjob "At minute 0 past every hour from 9 to 17"
crontab -l | echo "0 9-17 * * * cd $folder_path && ./test.sh $file_name" | crontab -