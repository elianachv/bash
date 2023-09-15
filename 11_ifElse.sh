#!/bin/bash
# Script to experiment with conditionals 
# Author Eliana Chavez

score=0
age=0

echo "Conditionals example"
read -n1 -p "What's your score?" score

if (( $score >=7 )); then
    echo "You passed"
else
    echo "You failed"
fi

read -p "How old are you? " age

if [ $age -ge 18 ]; then
    echo "You can vote"
else
    echo "You cannot vote"
fi


