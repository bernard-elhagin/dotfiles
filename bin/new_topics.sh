#!/usr/bin/bash

#./create_topics.sh new_topics.txt

cat new_topics.txt >> topics.txt
cat /dev/null > new_topics.txt
