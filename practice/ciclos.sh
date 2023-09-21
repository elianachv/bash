#!/bin/bash
# Author: Eliana Chavez

read -p "Digit your favorite fruits: " fruits
IFS=" "
# -a means read will receive an array
# IFS specifies the split symbol
# <<< read a variable and add it to fruitsList variable
# The string received in the first read call is kept in variable fruits
# fruits is transformed in an array and kept in fruitsList variable
# Finally ww print every fruit with a for loop
read -a fruitsList <<< "$fruits"
# ${fruitsList[@]} could be use too to specify all positions
for fruit in ${fruitsList[*]}
do
    echo $fruit
done

# echo $fruitsList
