#!/bin/bash
# Menu to handle postgress utilities
# Author Eliana Chavez

option=0

installPostgress () {
    echo -e "\nInstalling postgress"
    sudo yum install -y postgress
}

unistallPostgress () {
    echo -e "\nUninstalling postgress"
    sudo yum unistall postgress
}

backupDb () {
    echo -e "\n"
    db=""
    read -p "Wich database do you want to backup? " db
    echo "Preparing backup for $db"
}

restoreBackup () {
    echo -e "\nRestoring backup"
    # echo "param1: $1"
}


exitProgram () {
    echo -e "\nThanks for using PGTIL"
    exit 0
}


while :
do
    clear
    echo "___________________________________"
    echo " PGTIL - Postgress utility program "
    echo "___________________________________"
    echo "              MENU                 "
    echo "___________________________________"
    echo " 1. Install Postgress"
    echo " 2. Uninstall Postgress"
    echo " 3. Backup a database"
    echo " 4. Restore backup"
    echo " 5. Exit"
    
    read -n1 -p "Digit your option (1 - 5): " option
    case $option in
        1) 
            installPostgress
            sleep 3
            ;;
        2) 
            unistallPostgress
            sleep 3
            ;;
        3)
            backupDB
            sleep 3
            ;;
         4) 
            # restoreBackup param1 param2
            restoreBackup
            sleep 3
            ;;
         5)
            finishProgram
            ;;
         *) 
            echo -e "\nError"
            ;;
    esac
done
