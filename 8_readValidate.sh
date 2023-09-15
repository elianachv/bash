#!/bin/bash
# Script to validate user inputs 
# Author Eliana Chavez

option=0
backupName=""
pass=""

echo "Postgress utilities"
# Accept just 1 char
read -n1 -p "Choose an option: " option
echo -e "\n"
# Accept just 10 chars
read -n10 -p "Set the backup file name: " backupName
echo -e "\n"
echo "Opcion: $option Backup name: $backupName"
echo -e "\n"
# Do not expose password
read -s -p "Password:" pass
echo "Password: $pass"
