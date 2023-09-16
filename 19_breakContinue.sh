#!/bin/bash
# Script to understand break and continue within loops
# Author Eliana Chavez

echo "Break and Continue"
for file in `ls -tr challenges`
do
    echo "ARCHIVO: $file"
    for num in {1..2}
    do
        if [ $file == "conditionals.sh" ]; then
            echo "BREAK"
            break;
        elif [[ $file == 1* ]]; then
            echo "CONTINUE"
            continue;
        else 
            echo "Nombre archivo $file _ $num"
        fi
    done
done


