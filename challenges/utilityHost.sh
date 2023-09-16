#!/bin/bash
# Challenge 1: print the value of 2 variables
# Challenge 5: modify this script to generate a log file
# Author: Eliana Chavez

option=$1
result=$2
time=$(date +"%Y%m%d%H%S")
fileName="log$time.txt"

if [ $# -ne 2 ]; then
    echo "Expect 2 parameters found $#"
    exit 1
fi

echo "Challenge 1 solved! Look option = $option result = $result"
echo "Challenge 5 status: processing"
echo "Generating log..."

if [[ ! -d "logs" ]]; then
    echo "Creating logs directory"
    mkdir -m 755 logs
fi

cat <<EOM >> logs/$fileName
[$time] Challenge 5 solved: option => $option result = $result
EOM

echo "Challenge 5 status: success"
ls -la logs/
echo "Reading last log"
cat logs/$fileName
