#!/bin/bash
##!/bin/sh
#while true;
#do
#    clear
#    git log \
#    --graph \
#    --all \
#    --color \
#    --date=short \
#    -40 \
#    --pretty=format:"%C(yellow)%h%x20%C(white)%C(red)%d%C(white)%x20%s%x20%C(bold)%Creset" |
#    cat -
#    sleep 1
#done
numRegex='[0-9]+$'
usrLen=$1
usrTime=$2
defLen=15
defTime=3

# Command line argument processing
if [[ $usrLen =~ $numRegex && $usrTime =~ $numRegex ]]; then
    echo ''
else
	# Invalid or no lines and refresh rate were provided
	# so instead, using defaults instead.
    usrLen=$defLen
    usrTime=$defTime
fi

# Infinite loop for displaying a portion of the graph
# at specified refresh intervals.
while :
do
    clear
    git --no-pager log -$usrLen --graph --all --pretty=format:'%Cgreen%h%Creset -%C(yellow)%d%Creset %s' --abbrev-commit --date=relative
    sleep $usrTime
done
