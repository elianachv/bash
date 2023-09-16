#!/bin/bash
# Script to understand how make some operations in a file
# Author Eliana Chavez

echo "Files operations"
mkdir -m 755 backups

echo -e "\nCopy files into backup"
cp *.* backups/
ls -latrh backups/

echo -e "\nMoving backup to home"
mv backups/ $HOME

echo -e "\nDeleting deleted.txt file"
rm -r deleted.txt
