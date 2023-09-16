#!/bin/bash
# Menu to handle postgress utilities
# Author Eliana Chavez

option=0

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
            echo -e "\nIntalling postgress ..."
            sleep 3
            ;;
        2) 
            echo -e "\nUninstalling postgress..."
            sleep 3
            ;;
        3)
            echo -e "\n"
            db=""
            read -p "Wich database do you want to backup? " db
            echo "Preparing backup for $db"
            sleep 3
            ;;
         4) 
            echo -e "\nRestoring database"
            sleep 3
            ;;
         5)
            echo -e "\nThanks for using PGTIL"
            exit 0
            ;;
         *) 
            echo -e "\nError"
            ;;
    esac
done
