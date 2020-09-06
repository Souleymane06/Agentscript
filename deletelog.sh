#!/bin/bash 

#Description: Delete log file older than 14 days

#Author: Souleymane 

echo -e "n\deleting files 14 days older\n"

find /var/log  -name '*.log' +14 rm -rf {} \;

exit 0

