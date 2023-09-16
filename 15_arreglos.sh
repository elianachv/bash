#!/bin/bash
# Script to understand arrays
# Author Eliana Chavez

arrayNumbers=(1 2 3 4 5 6)
arrayStrings=(Marco, Antonio, Pedro, Susan)
arrayRanges=({A..Z} {10..20})

#Printing all

echo "Array Numbers: ${arrayNumbers[*]}"
echo "Array Strings: ${arrayStrings[*]}"
echo "Array Range: ${arrayRanges[*]}"

# Print arrays size
echo "Array Numbers Size: ${#arrayNumbers[*]}"
echo "Array Strings Size: ${#arrayStrings[*]}"
echo "Array Ranges Size: ${#arrayRanges[*]}"

# Print values in a specific position
echo "Array Numbers at position 2: ${arrayNumbers[2]}"
echo "Array Strings at position 2: ${arrayStrings[2]}"
echo "Array Ranges at position 2: ${arrayRanges[2]}"

# Add and delete values
arrayNumbers[7]=20
unset arrayNumbers[0]
echo "Array Numbers: ${arrayNumbers[*]}"
echo "New size array numbers: ${#arrayNumbers[*]}"

