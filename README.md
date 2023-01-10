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

# How to Test

1. `cd` to the working directory
2. Run the **setup_cron** script
``` 
bash setup_cron.sh 
```
3. Check if the cronjob is setup in local
``` 
crontab -l
```
