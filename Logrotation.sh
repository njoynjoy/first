#!/bin/bash

#Declare Variables
 LOG_DIR = /var/log
 LOG_ROT = /var/log/logrotation.log

 if [ ! d "$LOG_DIR" ] then
         echo " [$date] ERROR:Log Directory $LOG_DIR does not exist!" >> "$LOG_ROT"
         exit 1

find "$LOG_DIR"  -type f -name "*.log" -mtime +7 ! -mtime -30 ! -name "*.gz" -exec gzip {} \; -exec echo"[$date] sucessfully compressed: {}" >> "$LOG_ROT"
{} \;

find "$LOG_DIR" -type f -name "*.gz" -mtime +30 -exec rm -f {} \; -exec echo " [$date] succesfully deleted: {} " >> "$LOG_ROT" {} \;


echo " [$date] log roatation is sucessfull " >> "$LOG_ROT"
