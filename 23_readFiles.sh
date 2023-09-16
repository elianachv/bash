#!/bin/bash
# Script to understand how read a file
# Author Eliana Chavez

echo "Reading a file"
cat $1

echo -e "\nSet input into a variable"
catValue=$(cat $1)
echo "catValue = $catValue"

echo -e "\nReading files line per line"
while IFS= read line
do
    echo "Line $line"

done < $1


