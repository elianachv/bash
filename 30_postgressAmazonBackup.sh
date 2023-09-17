# ! /bin/bash
# Script to install postgress in Amazon Linux
# Autor: Eliana Chavez

option=0
db=""
backupDir=""
restoreBackup=""
date=$(date +"%Y%m%d%H%S")
password=""
passwordPostgres=""

installPostgressAmazonLinux () {
    echo -e "\n Verifying postgres instalation ...."
    verifyInstall=$(which psql)
    if [ $? -eq 0 ]; then
        echo -e "\n Postgres have been already installed"
    else
        echo -e ""
        read -s -p "Digit sudo password: " password
        echo -e ""
        read -s -p "Digit postgres password: " passwordPostgres
        echo "$password" | sudo -S yum update
        echo "$password" | sudo -S yum -y install postgresql15-server
        sudo postgresql-setup --initdb
        sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '{$passwordPostgres}';"
        echo "$password" | sudo -S systemctl enable postgresql.service
        echo "$password" | sudo -S systemctl start postgresql.service
        sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '{$passwordPostgres}';"
    fi    
    read -n 1 -s -r -p "PRESS [ENTER] to continue..."
}

uninstallPostgressAmazonLinux () {
    echo -e ""
    read -s -p "Digit sudo password: " password
    echo -e "\n"
    echo "$password" | sudo -S systemctl stop postgresql.service
    echo "$password" | sudo -S yum -y remove postgresql\*
    echo "$password" | sudo -S rm -r /var/lib/pgsql
    read -n 1 -s -r -p "PRESS [ENTER] to continue..."
}

backupDb () {
    echo -e ""
    read -s -p "Digit sudo password: " password
    echo -e ""
    echo -e "\nListing databases:"
    sudo -u postgres psql -c "\l"

    read -p "Which database do you want to backup? " db
    read -p "Which directory you would use to save the backup? " backupDir
    if [ -d $backupDir ]; then
        echo "$password" | sudo -S chmod 755 $backupDir   
        echo -e "Preparing $db backup\n"
        echo "Sending backup to $bsckupDir"
        sudo -u postgres pg_dump -Fc $db > "$backupDir/backup-$db-$date.bak"
    else
        echo "Directory $backupDir does not exist. Please create it or select another one"
    fi

    read -n 1 -s -r -p "PRESS [ENTER] to continue..."
}

restoreBackupDb () {
    read -p "In which directory do you save your backups? " backupDir
    echo -e "\nListing available backups:\n"
    sudo ls -latr $backupDir
    read -p "Which backup do you want to restore? " restoreBackup
    read -p "In which database do you want to restore the backup? " db
    
    if [ -f "$backupDir/$restoreBackup" ]; then
        echo "$restoreBackup is available"
        
        verifydb=`sudo -u postgres psql -lqt | cut -d \|-f 1 | grep -wq $db`
        if [ verifydb -eq 0 ]; then
            echo -e "\nRestoring $restoreBackup into $db"
        else
            echo -e "\nCreating database $db"
            sudo -u postgres psql -c "create database $db"
        fi

        echo -e "\nRestoring $restoreBackup into $db"
        sudo -u postgres pg_restore -Fc -d $db "$backupDir/$restoreBackup"
        echo -e "\nListing databases:"
        sudo -u postgres psql -c "\l"
    else
        echo -e "\nBackup $restoreBackup does not exist"
    fi 
    read -n 1 -s -r -p "PRESS [ENTER] to continue..."

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
            installPostgressAmazonLinux
            ;;
        2) 
            uninstallPostgressAmazonLinux
            ;;
        3)
            backupDb
            ;;
         4) 
            # restoreBackup param1 param2
            restoreBackupDb
            ;;
         5)
            exitProgram
            ;;
         *) 
            echo -e "\nError"
            ;;
    esac
done
