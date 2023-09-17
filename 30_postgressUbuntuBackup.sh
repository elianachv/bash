# ! /bin/bash
# Script to install postgress in Ubuntu
# Autor: Eliana Chavez

option=0
db=""
backupDir=""
date=$(date +"%Y%m%d%H%S")

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
    echo -e "\nListing databases:"
    sudo -u postgres psql -c "-l"

    read -p "Which database do you want to backup? " db
    read -p "Which directory you would use to save the backup? " backupDir
    if [ -d $backupDir ]; then
        echo "$sudoPassword" | sudo -S chmod 755 $backupDir
        echo -e "Preparing $db backup\n"
        echo "Sending backup to $fileBackup"
        sudo -u postgres pg_dump -Fc $db > "$backupDir/backup-$db-$date.bak"
        read -n 1 -s -r -p "PRESS [ENTER] to continue..."
    else
        echo "$backupDir does not exist"
    fi
}

restoreBackup () {
    echo -e "\nListing available backups\n:"
    ls -latr $backupDir
    read -p "Which backup do you want to restore? " restoreBackup
    read -p "In which database do you want to restore the backup? " db
    
    if ![[ -f $restoreBackup ]]; then
        echo -e "\nBackup $restoreBackup does not exist"
        return
    fi
    
    verifydb=`sudo -u postgres psql -lqt | cut -d \|-f 1 \ grep -wq $db`
    if [verifydb -eq 0 ]; then
        echo -e "\nRestoring $restoreBackup into $db"
    else
        echo -e "\nCreating database $db"
        echo -e "\nRestoring $restoreBackup into $db"
    fi

    sudo -u postgres pg_restore -Fc -d $db "$backupDir/$restoreBackup"
    echo -e "\nListing databases:"
    sudo -u postgres psql -c "-l"

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
