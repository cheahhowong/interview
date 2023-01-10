# HTTP Status Error Counting Bash Script

This repository contains bash scripts that does the following

- Counts the number of HTTP 4xx and 5xx response statuses in the apache
log file. The filename would be provided as a parameter to the script
- If the cumulative number of errors exceeds 100, send an email alert
reporting on the high number of error responses and relevant information
- The script is expected to be run periodically (e.g. every hour) to check if
the threshold for the errors have been met for the period of time.

# Github

## Clone the repository
Git clone using SSH if HTTPS didn't work.
```
git clone https://github.com/cheahhowong/interview.git
git clone git@github.com:cheahhowong/interview.git (for SSH)
```

### Note before testing

- Please change the email address to your email in ``test.sh`` file
- Change the cron time to `* * * * *` before running `setp_cron.sh` script so that the email will send out every minute for testing purpose
- 

# How to Test Task 1

1. `cd` to the working directory
2. Run the **setup_cron** script
```
bash setup_cron.sh 
```
3. Enter your working directory path from root (eg: **~/Downloads/test/questions**)
4. Enter filename that contains the apache log file (eg: **testdata.log**)
5. Check if the cronjob is setup in local
```
crontab -l
```
6. You should see the file will contain either one
```
* * * * * cd $folder_path && ./test.sh testdata.log

0 9-17 * * * cd $folder_path && ./test.sh testdata.log
```
7. You should received an email with Subject **Number of HTTP 4xx/5xx Errors Exceeded 100!**. The apache log file is attached along with the email

# Task 2

## Question
As time passes, the log files for your application have piled up, and the machine
is running out of storage. Briefly describe how you would resolve this in a short paragraph, taking into considerations that:

- On rare occasion, logs up to 3 months old are required for troubleshooting/investigations
- Audit requirements dictate that logs are to be kept for at least 7years
- The machine is currently storing 6 months worth of logs, and would run
out of storage within the week. Increasing storage is not an option within the next 12 months

## Answer
Based on the requirement above, if the system is storing logs in batches or in single .txt/log file, we can prepare a shell script to read the log file and move the old log file to somewhere else for example AWS S3 & S3 Glacier. We should prepare a cronjob for this shell script so that we don't have to run the shell scripts manually.

Since the machine will run out of storage around 6 months worth of logs and sometimes we need logs up to 3 months old, the script should move only those logs that are older than 3 months to S3. In S3, we can configure the S3 lifecycle policy to move the object from S3 to S3 Glacier immediately after the object creation. We should add expiration rule also to make sure the logs will get deleted in S3 Glacier after 7 years old. 

The S3 Glacier is perfect for data archival because they provide a very low rate to store object for long term. Thus, we can save a long of cost on storing those log for audit purpose.
