#!/bin/bash
# Script to understand while loops
# Author Eliana Chavez

number=1

while [ $number -ne 10 ]
do
    echo "Printing $number"
    number=$((number + 1))
done


