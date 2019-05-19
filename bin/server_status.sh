#!/bin/sh

hostname=$(hostname | cut -f 3 -d '-' | cut -c1-1)

case $hostname in
    'w' ) systemctl status kafka.service;;
    'z' ) systemctl status zookeeper.service;;
esac
break
