#!/bin/bash
# Script to understand how to pack a script
# Author Eliana Chavez

echo "Pack all the scripts in a zip file"

# Using tar it allows multiple files
echo "Packeing all scripts with tar"
tar -cvf shellCourse.tar *.sh

# Using gzip it allows jus one file but it is optimized
# It is used to pack a tar folder and deletes the tar dir
echo "Packing .tar folder with a 9 ratio"
gzip -9 shellCourse.tar


# Using pbzip2 supports multicore
# It must be installed it works like gzip
echo "Packing .tar folder with pbzip2"
tar cvf *.sh -c > shellCourse2.tar.bz2
