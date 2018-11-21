#!/usr/bin/bash

DEV='dev-kafka-mgt01'
QA='test-kafka-mgt01'
FIX='test-kafka-fix-mgt01'
PREP='test-kafka-prep-mgt01'
PROD='prod-kafka-prod-mgt01'

environment=`hostname`

case $environment in
    $DEV  ) zookeeper="dev-kafka-zk01.atena.pl:2181";;
    $QA   ) zookeeper="test-kafka-zk01.atena.pl:2181";;
    $FIX  ) zookeeper="test-kafka-fix-zk01.hestia.polska:2181";;
    $PREP ) zookeeper="test-kafka-prep-zk01.hestia.polska:2181";;
    $PROD ) zookeeper="prod-kafka-prod-zk01.hestia.polska:2181";;
esac

while IFS='' read -r line || [[ -n "$line" ]]; do
    topic=$(echo $line | cut -f 1 -d" ")
    retention=$(echo $line | cut -f 2 -d" ")

    retention_ms=$(($retention*24*60*60*1000))

    /opt/kafka/bin/kafka-configs.sh --zookeeper $zookeeper --entity-name $topic --entity-type topics --alter --add-config retention.ms=$retention_ms
    /opt/kafka/bin/kafka-topics.sh --zookeeper $zookeeper --topic $topic --alter --partitions 3
    /opt/kafka/bin/kafka-reassign-partitions.sh --zookeeper $zookeeper --reassignment-json-file increase-replication-factor.json --execute
done < "$1"

exit 0
