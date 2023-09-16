#!/bin/bash
# Script to understand how write in a file
# Author Eliana Chavez

echo "Writing a file"

echo "Values written with echo..." >> $1

# Adding multiple lines
cat <<END >> $2
Values written with cat
Argument 2: $2
END
