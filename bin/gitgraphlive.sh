#!/bin/sh
while true;
do
    clear
    git log \
    --graph \
    --all \
    --color \
    --date=short \
    -40 \
    --pretty=format:"%C(yellow)%h%x20%C(white)%C(red)%d%C(white)%x20%s%x20%C(bold)%Creset" |
    cat -
    sleep 1
done
