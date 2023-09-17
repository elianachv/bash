# ! /bin/bash
# Script to install postgress in Ubuntu
# Autor: Eliana Chavez

opcion=0

installPostgressUbuntu () {
    echo -e "\n Verifying postgres instalation ...."
    verifyInstall=$(which psql)
    if [ $? -eq 0 ]; then
        echo -e "\n Postgres have been already installed"
    else
        echo -e "\n"
        read -s -p "Digit sudo password: " password
        echo -e "\n"
        read -s -p "Digit postgres password: " passwordPostgres
        echo "$password" | sudo -S apt update
        echo "$password" | sudo -S apt-get -y install postgresql postgresql-contrib
        sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '{$passwordPostgres}';"
        echo "$password" | sudo -S systemctl enable postgresql.service
        echo "$password" | sudo -S systemctl start postgresql.service
    fi    
    read -n 1 -s -r -p "PRESS [ENTER] to continue..."
}

uninstallPostgressUbuntu () {
    echo -e "\n"
    read -s -p "Digit sudo password: " password
    echo -e "\n"
    echo "$password" | sudo -S systemctl stop postgresql.service
    echo "$password" | sudo -S apt-get -y --purge remove postgresql\*
    echo "$password" | sudo -S rm -r /etc/postgresql
    echo "$password" | sudo -S rm -r /etc/postgresql-common
    echo "$password" | sudo -S rm -r /var/lib/postgresql
    echo "$password" | sudo -S userdel -r postgres
    echo "$password" | sudo -S groupdel postgresql
    read -n 1 -s -r -p "PRESS [ENTER] to continue..."
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
            installPostgressUbuntu
            ;;
        2) 
            uninstallPostgressUbuntu
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
            exitProgram
            ;;
         *) 
            echo -e "\nError"
            ;;
    esac
done
