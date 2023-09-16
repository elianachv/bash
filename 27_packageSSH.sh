#!/bin/bash
# Script to understand how to pack a script and send it throught internet using rsync
# Author Eliana Chavez

host=""
user=""

echo "Pack all the scripts in a zip file and transfer it to another server"
read -p "Digit destination host: " host
read -p "Digit destination user: " user

echo -e "\nPacking folder an tranfer it"
rsync -avz $(pwd) $user@$host:/C:/Users/elian/Downloads
