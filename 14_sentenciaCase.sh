#!/bin/bash
# Script to experiment with case sentence 
# Author Eliana Chavez

option=""

read -p "Choose a letter (A-Z): " option
case $option in
    "A") echo -e "\nSave file";;
    "B") echo -e "\n Delete file";;
    [C-E]) echo "No operation";;
    *) echo "Invalid option";;
esac



