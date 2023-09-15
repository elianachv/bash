#!/bin/bash
# Script to experiment with several conditionals 
# Author Eliana Chavez

age=0

read -p "How old are you? " age

if [ $age -le 18 ]; then
    echo "You are a teeneger"
elif [ $age -ge 19 ] && [ $age -le 64 ]; then
    echo "You are an adult"
else
    echo "You are an elder"
fi


