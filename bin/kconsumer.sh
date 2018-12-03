#!/usr/bin/sh

DEV='dev-kafka-mgt01'
QA='test-kafka-mgt01'
FIX='test-kafka-fix-mgt01'
SZKOL='test-kafka-szkol-mgt01'
PREP='test-kafka-prep-mgt01'
PROD='prod-kafka-prod-mgt01'

KAFKA_PATH=`dirname $(which kafka-console-consumer.sh)`

if [ $# -eq 0 ]
then
    environment=`hostname`
else
    case $1 in
        'dev'   ) environment=$DEV;;
        'fix'   ) environment=$FIX;;
        'qa'    ) environment=$QA;;
        'szkol' ) environment=$SZKOL;;
        'prep'  ) environment=$PREP;;
        'prod'  ) environment=$PROD;;
        *       ) echo "Możliwe wartości: dev - fix - qa - prep - prod" && exit;;
    esac
fi

ssl_or_not()
{
    PS3='Masz truststora z certyfikatami? '

    select ssl in 'tak' 'nie'
    do
        case $ssl in
            'tak' ) brokers="${1}9093";;
            'nie' ) brokers="${1}9092";;
            *     ) brokers="${1}9092";;
        esac
        break
    done

    echo
    echo "Broker: $brokers"
    echo
}

case $environment in
    $DEV   ) zookeeper="dev-kafka-zk01.atena.pl:2181"            && ssl_or_not "dev-kafka-wrk01.atena.pl:";;
    $QA    ) zookeeper="test-kafka-zk01.atena.pl:2181"           && ssl_or_not "test-kafka-wrk01.atena.pl:";;
    $FIX   ) zookeeper="test-kafka-fix-zk01.hestia.polska:2181"  && ssl_or_not "test-kafka-fix-wrk01.hestia.polska:";;
    $SZKOL ) zookeeper="test-kafka-szkol-zk01.hestia.polska:2181" && ssl_or_not "test-kafka-szkol-wrk01.hestia.polska:";;
    $PREP  ) zookeeper="test-kafka-prep-zk01.hestia.polska:2181" && ssl_or_not "test-kafka-prep-wrk01.hestia.polska:";;
    $PROD  ) zookeeper="prod-kafka-prod-zk01.hestia.polska:2181" && ssl_or_not "prod-kafka-prod-wrk01.hestia.polska:";;
esac
break

action_choice()
{
    select act
    do
        action=$act
        break
    done
}

topic_choice()
{
    select topic
    do
        case $action in
            'produce'  ) produce  $topic;;
            'consume'  ) consume  $topic;;
            'describe' ) describe $topic;;
            *          ) consume  $topic;;
        esac
        break
    done
}

consume()
{
    echo
    echo "Pobieram wiadomości z $topic"
    echo

    case $ssl in
        'tak' ) $KAFKA_PATH/kafka-console-consumer.sh --bootstrap-server $brokers --topic $topic --from-beginning --consumer.config ~/kafka/config/client-ssl.properties 2>/dev/null;;
        'nie' ) $KAFKA_PATH/kafka-console-consumer.sh --bootstrap-server $brokers --topic $topic --from-beginning 2>/dev/null;;
    esac
    break
}

produce()
{
    echo
    echo "Piszę na topic $topic"
    echo

    case $ssl in
        'tak' ) $KAFKA_PATH/kafka-console-producer.sh --broker-list $brokers --topic $topic --producer.config ~/kafka/config/client-ssl.properties 2>/dev/null;;
        'nie' ) $KAFKA_PATH/kafka-console-producer.sh --broker-list $brokers --topic $topic 2>/dev/null;;
    esac
    break
}

describe()
{
    echo
    echo "Pobieram info nt. topicu $topic"
    echo

    $KAFKA_PATH/kafka-topics.sh --zookeeper $zookeeper --topic $topic --describe 2>/dev/null
}

PS3='Co robimy: '
action_choice "produce" "consume" "describe"

echo "Pobieram listę topiców z $zookeeper"

PS3='Wybierz topic: '
topic_choice `$KAFKA_PATH/kafka-topics.sh --list --zookeeper $zookeeper 2>/dev/null`

exit 0
