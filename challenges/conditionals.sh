#!/bin/bash
# Challenge 3: Ask the user to insert a number (1-5) Build different options# Author: Eliana Chavez
#

option=0

echo "Guess your luck"
read -n1 -p "Chose a number 1 - 5: " option
echo ""

if [ $option -eq 1 ]; then
    echo "You chose 1, you will be rich"
elif [ $option -eq 2 ]; then
    echo "You chose 2, you will find that job"
elif [ $option -eq 3 ]; then
    echo "You chose 3, you will fall in love"
elif [ $option -eq 4 ]; then
    echo "You chose 4, you will buy a new car"
elif [ $option -eq 5 ]; then
    echo "You chose 5, you will pay your doubts"
else
    echo "You chose $option and it's not a valid option"
fi
