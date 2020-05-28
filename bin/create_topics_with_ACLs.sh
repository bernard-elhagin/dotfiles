DEV='dev-kafka-mgt01'
QA='test-kafka-mgt01'
FIX='test-kafka-fix-mgt01'
PREP='test-kafka-prep-mgt01'
PROD='prod-kafka-prod-mgt01'
SZKOL='test-kafka-szkol-mgt01'
BALDEV='btct-kafka'
BALTEST='btts-kafka[0-2]'

environment=$(hostname)

case $environment in
    $DEV   ) zookeeper="dev-kafka-zk01.atena.pl:2181";;
    $QA    ) zookeeper="test-kafka-zk01.atena.pl:2181";;
    $FIX   ) zookeeper="test-kafka-fix-zk01.hestia.polska:2181";;
    $PREP  ) zookeeper="test-kafka-prep-zk01.hestia.polska:2181";;
    $PROD  ) zookeeper="prod-kafka-prod-zk01.hestia.polska:2181";;
    $SZKOL ) zookeeper="test-kafka-szkol-zk01.hestia.polska:2181";;
    *      ) zookeeper="localhost:2181";;
esac

# filename to argument skryptu wskazujący na plik
# z listą topiców do utworzenia
filename="$1"
while IFS='' read -r line || [[ -n "$line" ]]; do
    topic=$(echo "$line" | cut -f 1 -d" ")
    retention=$(echo "$line" | cut -f 2 -d" ")
    partitions=$(echo "$line" | cut -f 3 -d" ")
    jaas_user=$(echo "$line" | cut -f 4 -d" ")

    retention_ms=$((retention*24*60*60*1000))

    echo "/opt/kafka/bin/kafka-topics.sh --create --zookeeper $zookeeper --replication-factor 3 --partitions $partitions --topic "$topic" --config retention.ms=$retention_ms"
    echo "
    "
    echo "/opt/kafka/bin/kafka-acls.sh --authorizer-properties zookeeper.connect=$zookeeper --add --allow-principal User:$jaas_user --operation All --topic "$topic" --group=\'*\'"
    echo "
    "
    /opt/kafka/bin/kafka-topics.sh --create --zookeeper $zookeeper --replication-factor 3 --partitions $partitions --topic "$topic" --config retention.ms=$retention_ms
    /opt/kafka/bin/kafka-acls.sh --authorizer-properties zookeeper.connect=$zookeeper --add --allow-principal User:$jaas_user --operation All --topic "$topic" --group=\'*\'
done < "$filename"
exit 0
