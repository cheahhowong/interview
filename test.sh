#!/bin/bash
file=$1
i=0

for line in `awk '{print $9}' $file`
do
  if [[ "$line" =~ (^[4]|^[5]) ]]
	then
		((i++))
		if [[ $i == 100 ]]
		then
			sender="monitoringteam@gmail.com"
			recipients="cheahhowong@gmail.com"
			subject="Number of HTTP 4xx/5xx Errors Exceeded 100!"
			msgbody="Hi DevOps Team, \n HTTP 4xx and 5xx errors exceeded 100 times. \n Please refer to the attachment and fix the error. \n Best Regards, \n Monitoring Alert Team"
			/usr/local/bin/sendemail -f "$sender" -t "$recipients" -u "$subject" -a $file -m "$msgbody"	

			break
		fi
	fi
done