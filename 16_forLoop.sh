#!/bin/bash
# Script to understand for loops
# Author Eliana Chavez

arrayNumbers=(1 2 3 4 5 6)

echo "Iterate list of numbers"
for num in ${arrayNumbers[*]}
do
    echo "Numero: $num"
done

arrayStrings=(Marco, Antonio, Pedro, Susan)
echo "Iterate list of strings"
# You can directly set the values to iterate
# "Lina" "Nixon" "Eli"
for name in ${arrayStrings[*]}
do
    echo "Nombre: $name"
done

echo "Iterate files"
for file in *
do
    echo "Archivo: $file"
done

echo "Iterar using commands in `pwd`"

# Another way to specify commands $(ls)

for file in `ls`
do
    echo "File in this directory: $file"
done

echo "Iterate with deafult for"
for (( i=1; i<10; i++ ))
do
    echo "Number i: $i"
done
