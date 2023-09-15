#!/bin/bash
# Script to practice options 
# Author Eliana Chavez

echo "Options"
echo "Option 1 sent: $1"
echo "Option 2 sent: $2"
echo "options sent $*"
echo -e "\n"
echo "Getting values"

while [ -n "$1" ]
do
case "$1" in 
-a) echo "-a used";;
-b) echo "-b used";;
-c) echo "-c used";;
 *) echo "No es una opción";;
esac
shift
done

