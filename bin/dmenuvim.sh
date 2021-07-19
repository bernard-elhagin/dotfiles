#!/usr/bin/bash

TERMINAL="xfce4-terminal -e"

if [ "$#" -eq "0" ]
then
    DIRECTORY="."
else
    DIRECTORY="$1"
fi

DMENU="rofi -dmenu -i -l 15"

FILE=$(find "$DIRECTORY" -maxdepth 1 -type f -exec grep -sIq . {} \; -print | $DMENU)

if [ -n "$FILE" ]
then
    if [ ! -f "$FILE" ]
    then
        FILE=$DIRECTORY/$FILE
    fi

    FILE=$(readlink -f "$FILE")
    echo "$FILE"

    if [ -n "$TERMINAL" ]
    then
        xfce4-terminal -e "vim $FILE"
    else
        vim "$FILE"
    fi
fi
