#!/bin/bash
# Exercise 2: validate a number between 0 and 100
# Author Eliana Chavez

number=0;

read -p "Digit a number: " number
if [ $number -gt 100 ] || [ $number -lt 0 ]; then
    echo "Invalid number"
else
    echo "You win"
fi
