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
    echo "Losowa liczba: $RANDOM" >> $filenamebase$filenumber.txt
    git add $filenamebase$filenumber.txt
    git commit -m "$filenamebase$filenumber"
done
