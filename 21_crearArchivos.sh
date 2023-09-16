#!/bin/bash
# Script to understand how to interact with files
# Author Eliana Chavez

echo "Files and directories"
if [ $# -ne 2 ]; then
    echo "Required 2 parameters but found $#"
    exit 1
fi

if [ $1 == "d" ]; then
    mkdir -m 755 $2
    echo "Directory $2 was created successfully"
    ls -la $2
elif [ $1 == "f" ]; then
    touch $2
    echo "File $2 created successfully"
    ls -la $2
else
    echo "No valid option: $1"
fi
