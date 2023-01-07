#!/bin/bash
read -p "Enter your path that clone repo (start with ~/): " folder_path

# set a cronjob "At minute 0 past every hour from 9 to 17"
crontab -l | echo "0 7-17 * * * cd $folder_path && ./test.sh testdata.log" | crontab -