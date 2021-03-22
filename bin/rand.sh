#!/bin/bash

#Sprawdzenie ilości argumentów
if [ -z "$2" ]; then ARG_ERR=ERR; fi
if [ -z "$1" ]; then ARG_ERR=ERR; fi
if [ -n "$ARG_ERR" ];
then
    echo "Usage: <filecount> <filenamebase>"
    exit
fi

count=$1
filenamebase=$2
for (( filenumber = 1; filenumber <= $count; filenumber++ )); do
    echo "Random number: $RANDOM" >> $filenamebase$filenumber.txt
    git add $filenamebase$filenumber.txt >/dev/null 2>/dev/null
    git commit -m "${filenamebase}_$filenumber" >/dev/null 2>/dev/null
done
