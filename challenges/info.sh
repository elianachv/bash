#!/bin/bash
# Challenge 2: Ask the user his/her personal info then print it
# Author: Eliana Chavez

name=""
age=""
phone=""
address=""

echo "Give us your info"
read -p "Whats your name?: " name
read -p "How old are you?: " age
read -p "Digit your phone: " phone
read -p "Digit your address: " address

echo "Thanks! this is your info"

echo "Name: $name Age: $age Address: $address Phone: $phone"
