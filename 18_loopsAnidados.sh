#!/bin/bash
# Script to understand nested for loops
# Author Eliana Chavez

echo "Nested loops"
for file in `ls`
do
    for nombre in {1..4}
    do
        echo "Nombre archivo $file _ $nombre"
    done
done


