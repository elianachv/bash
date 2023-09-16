#!/bin/bash
# Script to practice conditional expressions 
# Author Eliana Chavez

age=0
country=""
path=""

read -p "Digit yout age: " age
read -p "Digit your country: " country
read -p "Digit your file path: " path

echo -e "Conditional expressions with numbers \n"
if [ $age -lt 10 ]; then
    echo "You're a kid"
elif [ $age -ge 10 ] && [ $age -le 17 ]; then
    echo "You're a teen"
else
    echo "You're an adult"
fi

echo -e "Conditional expressions with strings \n"
if [ $country == "EEUU" ]; then
    echo "You're american"
elif [ $country == "Ecuador" ] || [ $country == "Colombia" ]; then
    echo "You're from South America"
else
    echo "We cannot detect your nationality"
fi

echo -e "Conditional expressions with files \n"
if [ -d $path ]; then
    echo "You're file exits"
else
    echo "You're file does not exist"
fi

