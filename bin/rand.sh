#!/bin/bash

#Ensure we have the quantity specified on the CLI
if [ -z "$2" ]; then ARG_ERR=ERR; fi
if [ -z "$1" ]; then ARG_ERR=ERR; fi
if [ -n "$ARG_ERR" ];
then
    echo "Usage: <filecount> <filenamebase>"
    exit
fi

count=$1
filenamebase=$2
for (( filenumber = 1; filenumber <= $count ; filenumber++ )); do
    echo "Some new random text: $RANDOM" >> $filenamebase$filenumber.java
    git add $filenamebase$filenumber.java
    git commit -m "$filenamebase$filenumber"
done
