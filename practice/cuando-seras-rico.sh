#!/bin/bash
# Exercise to receive user input and then greet
# Author: Eliana Chavez

name=""
age=0

read -p "What's your name? " name
read -p "What's your age? " age

echo "Hi, your name is ${name} and you are ${age} years old."
