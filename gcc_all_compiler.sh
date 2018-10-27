#!/bin/bash

notify="Compiling all C source files: "
echo $notify

LIST="$( ls *.c )"
let COUNTTRUE=0
let COUNTFALSE=0
for f in "$LIST";
do
file_Name=$(echo $f | cut -d'.' -f 1)
gcc $f -o file_Name
if [ "$?" -eq "0" ]; then
    let COUNTTRUE=$COUNTTRUE+1
    echo "gcc $f - $file_Name"
    echo "-----Success-----"
else
    let COUNTFALSE=$COUNTFALSE+1
    echo "-----Fail-----"
fi
done
echo $COUNTTRUE "C source files are compiled successfully."
echo $COUNTFALSE "C source files have compilation error(s)."

#END OF SCRIPT