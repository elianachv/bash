#!/bin/bash
# Script to check operator types
# Author: Eliana Chavez - elianachavezv@gmail.com

numA=10
numB=4

echo "Arithmetic Operators"
echo "Number A=$numA y B=$numB"
echo "Adding A + B =" $((numA + numB))
echo "Substract A - B =" $((numA - numB))
echo "Multiply A * B =" $((numA * numB))
echo "Divide A / B =" $((numA / numB))
echo "Mod of division A % B =" $((numA % numB))

echo -e "\nRelational Operators"
echo "Number A=$numA y B=$numB"
echo "A > B =" $((numA > numB))
echo "A < B =" $((numA < numB))
echo "A >= B =" $((numA >= numB))
echo "A <= B =" $((numA <= numB))
echo "A == B =" $((numA == numB))


echo -e "\nInteger Operators"
echo "Number A=$numA y B=$numB"
echo "A += B " $((numA += numB)) # numA = numA + numB
echo "A -= B " $((numA -= numB))
echo "A *= B " $((numA *= numB))
echo "A /= B " $((numA /= numB))
echo "A %= B " $((numA %= numB))
