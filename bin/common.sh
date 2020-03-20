#!/usr/bin/bash

# Setup environments
DEV='dev-kafka-mgt01'
QA='test-kafka-mgt01'
FIX='test-kafka-fix-mgt01'
PREP='test-kafka-prep-mgt01'
PROD='prod-kafka-prod-mgt01'
SZKOL='test-kafka-szkol-mgt01'

environment=$(hostname)

case $environment in

    $DEV   ) zookeeper="dev-kafka-zk01.atena.pl:2181,dev-kafka-zk02.atena.pl:2181,dev-kafka-zk03.atena.pl:2181"
             worker="dev-kafka-wrk01.atena.pl:9092,dev-kafka-wrk02.atena.pl:9092,dev-kafka-wrk03.atena.pl:9092" ;;

    $QA    ) zookeeper="test-kafka-zk01.atena.pl:2181,test-kafka-zk02.atena.pl:2181,test-kafka-zk03.atena.pl:2181"
             worker="test-kafka-wrk01.atena.pl:9092,test-kafka-wrk02.atena.pl:9092,test-kafka-wrk03.atena.pl:9092" ;;

    $FIX   ) zookeeper="test-kafka-fix-zk01.hestia.polska:2181,test-kafka-fix-zk02.hestia.polska:2181,test-kafka-fix-zk03.hestia.polska:2181"
             worker="test-kafka-fix-wrk01.hestia.polska:9092,test-kafka-fix-wrk02.hestia.polska:9092,test-kafka-fix-wrk03.hestia.polska:9092" ;;

    $PREP  ) zookeeper="test-kafka-prep-zk01.hestia.polska:2181,test-kafka-prep-zk02.hestia.polska:2181,test-kafka-prep-zk03.hestia.polska:2181"
             worker="test-kafka-prep-wrk01.hestia.polska:9092,test-kafka-prep-wrk02.hestia.polska:9092,test-kafka-prep-wrk03.hestia.polska:9092" ;;

    $PROD  ) zookeeper="prod-kafka-prod-zk01.hestia.polska:2181,prod-kafka-prod-zk02.hestia.polska:2181,prod-kafka-prod-zk03.hestia.polska:2181"
             worker="prod-kafka-prod-wrk01.hestia.polska:9092,prod-kafka-prod-wrk02.hestia.polska:9092,prod-kafka-prod-wrk03.hestia.polska:9092" ;;

    $SZKOL ) zookeeper="test-kafka-szkol-zk01.hestia.polska:2181,test-kafka-szkol-zk02.hestia.polska:2181,test-kafka-szkol-zk03.hestia.polska:2181"
             worker="test-kafka-szkol-wrk01.hestia.polska:9092,test-kafka-szkol-wrk02.hestia.polska:9092,test-kafka-szkol-wrk03.hestia.polska:9092" ;;

esac

echo $zookeeper
echo $worker
