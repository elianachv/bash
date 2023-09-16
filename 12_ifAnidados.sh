#!/bin/bash
# Script to experiment with nested conditionals 
# Author Eliana Chavez

score=0
next=""

echo "Conditionals example"
read -n1 -p "What's your score? " score
echo ""
if [ $score -ge 7 ]; then
    echo "You passed"
    read -n1 -p "Will you take next level? (y/n) " next
    if [ $next == "y" ]; then
        echo "Great! Welcome again"
    elif [ $next == "n" ]; then
        echo "We're sad to hear that"
    else
        echo "Not a valid option"
    fi
else
    echo "You failed"
fi




