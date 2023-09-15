#!/bin/bash
# Script to capture user inputs
# Author Eliana Chavez

option=0
backupName=""

echo "Postgress utilities"
echo -n "Choose an option: "
read
option=$REPLY

echo -n "Set the backup file name: "
read
backupName=$REPLY

echo "Opcion: $option Backup name: $backupName"
