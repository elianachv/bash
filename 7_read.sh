#!/bin/bash
# Script to capture user inputs with command read
# Author Eliana Chavez

option=0
backupName=""

echo "Postgress utilities"
read -p "Choose an option: " option
read -p "Set the backup file name: " backupName

echo "Opcion: $option Backup name: $backupName"
