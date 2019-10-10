# Kafka hosts [[[

DEV='dev-kafka-mgt01'
QA='test-kafka-mgt01'
FIX='test-kafka-fix-mgt01'
SZKOL='test-kafka-szkol-mgt01'
PREP='test-kafka-prep-mgt01'
PROD='prod-kafka-prod-mgt01'

KAFKA_DEV_MGT='dev-kafka-mgt01'
KAFKA_DEV_WRK1='dev-kafka-wrk01'
KAFKA_DEV_WRK2='dev-kafka-wrk02'
KAFKA_DEV_WRK3='dev-kafka-wrk03'
KAFKA_DEV_ZOO1='dev-kafka-zk01'
KAFKA_DEV_ZOO2='dev-kafka-zk02'
KAFKA_DEV_ZOO3='dev-kafka-zk03'

KAFKA_QA_MGT='test-kafka-mgt01'
KAFKA_QA_WRK1='test-kafka-wrk01'
KAFKA_QA_WRK2='test-kafka-wrk02'
KAFKA_QA_WRK3='test-kafka-wrk03'
KAFKA_QA_ZOO1='test-kafka-zk01'
KAFKA_QA_ZOO2='test-kafka-zk02'
KAFKA_QA_ZOO3='test-kafka-zk03'

KAFKA_TEST_MGT='10.200.53.54'
KAFKA_TEST_WRK1='10.200.53.51'
KAFKA_TEST_WRK2='10.200.53.52'
KAFKA_TEST_WRK3='10.200.53.53'
KAFKA_TEST_ZOO1='10.200.53.55'
KAFKA_TEST_ZOO2='10.200.53.56'
KAFKA_TEST_ZOO3='10.200.53.57'

KAFKA_SZKOL_MGT='10.200.53.34'
KAFKA_SZKOL_WRK1='10.200.53.31'
KAFKA_SZKOL_WRK2='10.200.53.32'
KAFKA_SZKOL_WRK3='10.200.53.33'
KAFKA_SZKOL_ZOO1='10.200.53.35'
KAFKA_SZKOL_ZOO2='10.200.53.36'
KAFKA_SZKOL_ZOO3='10.200.53.37'

KAFKA_FIX_MGT='10.200.53.61'
KAFKA_FIX_WRK1='10.200.53.58'
KAFKA_FIX_WRK2='10.200.53.59'
KAFKA_FIX_WRK3='10.200.53.60'
KAFKA_FIX_ZOO1='10.200.53.62'
KAFKA_FIX_ZOO2='10.200.53.63'
KAFKA_FIX_ZOO3='10.200.53.64'

KAFKA_PROD_MGT='10.200.43.54'
KAFKA_PROD_WRK1='10.200.43.51'
KAFKA_PROD_WRK2='10.200.43.52'
KAFKA_PROD_WRK3='10.200.43.53'
KAFKA_PROD_ZOO1='10.200.43.55'
KAFKA_PROD_ZOO2='10.200.43.56'
KAFKA_PROD_ZOO3='10.200.43.57'

KAFKA_BALTICA_TEST0='10.111.218.195'
KAFKA_BALTICA_TEST1='10.111.218.196'
KAFKA_BALTICA_TEST2='10.111.218.197'

# ]]]

# Kafka connect aliases [[[

alias kd="ssh bernard.elhagin@$KAFKA_DEV_MGT"
alias kdw1="ssh bernard.elhagin@$KAFKA_DEV_WRK1"
alias kdw2="ssh bernard.elhagin@$KAFKA_DEV_WRK2"
alias kdw3="ssh bernard.elhagin@$KAFKA_DEV_WRK3"
alias kdz1="ssh bernard.elhagin@$KAFKA_DEV_ZOO1"
alias kdz2="ssh bernard.elhagin@$KAFKA_DEV_ZOO2"
alias kdz3="ssh bernard.elhagin@$KAFKA_DEV_ZOO3"

alias kq="ssh bernard.elhagin@$KAFKA_QA_MGT"
alias kqw1="ssh bernard.elhagin@$KAFKA_QA_WRK1"
alias kqw2="ssh bernard.elhagin@$KAFKA_QA_WRK2"
alias kqw3="ssh bernard.elhagin@$KAFKA_QA_WRK3"
alias kqz1="ssh bernard.elhagin@$KAFKA_QA_ZOO1"
alias kqz2="ssh bernard.elhagin@$KAFKA_QA_ZOO2"
alias kqz3="ssh bernard.elhagin@$KAFKA_QA_ZOO3"

alias kf="ssh bernard.elhagin@$KAFKA_FIX_MGT"
alias kfw1="ssh bernard.elhagin@$KAFKA_FIX_WRK1"
alias kfw2="ssh bernard.elhagin@$KAFKA_FIX_WRK2"
alias kfw3="ssh bernard.elhagin@$KAFKA_FIX_WRK3"
alias kfz1="ssh bernard.elhagin@$KAFKA_FIX_ZOO1"
alias kfz2="ssh bernard.elhagin@$KAFKA_FIX_ZOO2"
alias kfz3="ssh bernard.elhagin@$KAFKA_FIX_ZOO3"

alias kt="ssh bernard.elhagin@$KAFKA_TEST_MGT"
alias ktw1="ssh bernard.elhagin@$KAFKA_TEST_WRK1"
alias ktw2="ssh bernard.elhagin@$KAFKA_TEST_WRK2"
alias ktw3="ssh bernard.elhagin@$KAFKA_TEST_WRK3"
alias ktz1="ssh bernard.elhagin@$KAFKA_TEST_ZOO1"
alias ktz2="ssh bernard.elhagin@$KAFKA_TEST_ZOO2"
alias ktz3="ssh bernard.elhagin@$KAFKA_TEST_ZOO3"

alias ks="ssh bernard.elhagin@$KAFKA_SZKOL_MGT"
alias ksw1="ssh bernard.elhagin@$KAFKA_SZKOL_WRK1"
alias ksw2="ssh bernard.elhagin@$KAFKA_SZKOL_WRK2"
alias ksw3="ssh bernard.elhagin@$KAFKA_SZKOL_WRK3"
alias ksz1="ssh bernard.elhagin@$KAFKA_SZKOL_ZOO1"
alias ksz2="ssh bernard.elhagin@$KAFKA_SZKOL_ZOO2"
alias ksz3="ssh bernard.elhagin@$KAFKA_SZKOL_ZOO3"

alias kp="ssh bernard.elhagin@$KAFKA_PROD_MGT"
alias kpw1="ssh bernard.elhagin@$KAFKA_PROD_WRK1"
alias kpw2="ssh bernard.elhagin@$KAFKA_PROD_WRK2"
alias kpw3="ssh bernard.elhagin@$KAFKA_PROD_WRK3"
alias kpz1="ssh bernard.elhagin@$KAFKA_PROD_ZOO1"
alias kpz2="ssh bernard.elhagin@$KAFKA_PROD_ZOO2"
alias kpz3="ssh bernard.elhagin@$KAFKA_PROD_ZOO3"

# Baltica
alias kbalttest0="ssh bernard.elhagin@$KAFKA_BALTICA_TEST0"
alias kbalttest1="ssh bernard.elhagin@$KAFKA_BALTICA_TEST1"
alias kbalttest2="ssh bernard.elhagin@$KAFKA_BALTICA_TEST2"

# ]]]

# Kafka helpers [[[

environment=`hostname`

case $environment in
    $DEV   ) zookeeper="dev-kafka-zk01.atena.pl:2181"             && brokers="dev-kafka-wrk01.atena.pl:9092,dev-kafka-wrk02.atena.pl:9092,dev-kafka-wrk03.atena.pl:9092";;
    $QA    ) zookeeper="test-kafka-zk01.atena.pl:2181"            && brokers="test-kafka-wrk01.atena.pl:9092,test-kafka-wrk02.atena.pl:9092,test-kafka-wrk03.atena.pl:9092";;
    $FIX   ) zookeeper="test-kafka-fix-zk01.hestia.polska:2181"   && brokers="test-kafka-fix-wrk01.hestia.polska:9092,test-kafka-fix-wrk02.hestia.polska:9092,test-kafka-fix-wrk03.hestia.polska:9092";;
    $SZKOL ) zookeeper="test-kafka-szkol-zk01.hestia.polska:2181" && brokers="test-kafka-szkol-wrk01.hestia.polska:9092,test-kafka-szkol-wrk02.hestia.polska:9092,test-kafka-szkol-wrk03.hestia.polska:9092";;
    $PREP  ) zookeeper="test-kafka-prep-zk01.hestia.polska:2181"  && brokers="test-kafka-prep-wrk01.hestia.polska:9092,test-kafka-prep-wrk02.hestia.polska:9092,test-kafka-prep-wrk03.hestia.polska:9092";;
    $PROD  ) zookeeper="prod-kafka-prod-zk01.hestia.polska:2181"  && brokers="prod-kafka-prod-wrk01.hestia.polska:9092,prod-kafka-prod-wrk02.hestia.polska:9092,prod-kafka-prod-wrk03.hestia.polska:9092";;
esac

describe_topic()
{
    topic=$(cat /tmp/topics.txt | fzf)
    echo "kafka-topics.sh --zookeeper $zookeeper --describe --topic $topic"
    kafka-topics.sh --zookeeper $zookeeper --describe --topic $topic
}

alias dt=describe_topic

list_topics()
{
    kafka-topics.sh --zookeeper $zookeeper --list
}

alias lt=list_topics

consume_topic()
{
    topic=$(cat /tmp/topics.txt | fzf)
    echo "kafka-console-consumer.sh --bootstrap-server $brokers --from-beginning --topic $topic"
    kafka-console-consumer.sh --bootstrap-server $brokers --from-beginning --topic $topic
}

alias ct=consume_topic

#--------------DEV-----------
KAFKA_DEV_BROKERS_SSL='dev-kafka-wrk01:9093,dev-kafka-wrk02:9093,dev-kafka-wrk03:9093'
KAFKA_DEV_BROKER1_SSL='dev-kafka-wrk01:9093'
KAFKA_DEV_BROKER2_SSL='dev-kafka-wrk02:9093'
KAFKA_DEV_BROKER3_SSL='dev-kafka-wrk03:9093'

alias  dev_consume="$KCC1$KAFKA_DEV_BROKERS_SSL$KCC2"
alias dev_consume1="$KCC1$KAFKA_DEV_BROKER1_SSL$KCC2"
alias dev_consume2="$KCC1$KAFKA_DEV_BROKER2_SSL$KCC2"
alias dev_consume3="$KCC1$KAFKA_DEV_BROKER3_SSL$KCC2"

alias dev_produce="$KCP1$KAFKA_DEV_BROKERS_SSL$KCP2"


#--------------TEST-----------
KAFKA_TEST_BROKERS_SSL='test-kafka-prep-wrk01.hestia.polska:9093,test-kafka-prep-wrk02.hestia.polska:9093,test-kafka-prep-wrk03.hestia.polska:9093'
KAFKA_TEST_BROKER1_SSL='test-kafka-prep-wrk01.hestia.polska:9093'
KAFKA_TEST_BROKER2_SSL='test-kafka-prep-wrk02.hestia.polska:9093'
KAFKA_TEST_BROKER3_SSL='test-kafka-prep-wrk03.hestia.polska:9093'

alias  test_consume="$KCC1$KAFKA_TEST_BROKERS_SSL$KCC2"
alias test_consume1="$KCC1$KAFKA_TEST_BROKER1_SSL$KCC2"
alias test_consume2="$KCC1$KAFKA_TEST_BROKER2_SSL$KCC2"
alias test_consume3="$KCC1$KAFKA_TEST_BROKER3_SSL$KCC2"

alias test_produce="$KCP1$KAFKA_TEST_BROKERS_SSL$KCP2"


#--------------PROD-----------
KAFKA_PROD_BROKERS_SSL='prod-kafka-prod-wrk01.hestia.polska:9093,prod-kafka-prod-wrk02.hestia.polska:9093,prod-kafka-prod-wrk03.hestia.polska:9093'
KAFKA_PROD_BROKER1_SSL='prod-kafka-prod-wrk01.hestia.polska:9093'
KAFKA_PROD_BROKER2_SSL='prod-kafka-prod-wrk02.hestia.polska:9093'
KAFKA_PROD_BROKER3_SSL='prod-kafka-prod-wrk03.hestia.polska:9093'

alias  prod_consume="$KCC1$KAFKA_PROD_BROKERS_SSL$KCC2"
alias prod_consume1="$KCC1$KAFKA_PROD_BROKER1_SSL$KCC2"
alias prod_consume2="$KCC1$KAFKA_PROD_BROKER2_SSL$KCC2"
alias prod_consume3="$KCC1$KAFKA_PROD_BROKER3_SSL$KCC2"

alias prod_produce="$KCP1$KAFKA_PROD_BROKERS_SSL$KCP2"

# ]]]

# Temp horton
alias horton="ssh el-hbe1@dev-hortonworkshdp-srv01.hestia.polska"

# WSO2 SSH aliases [[[
alias wd1='ssh -t logviewer@10.111.230.247 "cd logs; bash"'
alias wd2='ssh -t logviewer@10.111.230.248 "cd logs; bash"'
alias wdm='ssh -t logviewer@10.111.230.249 "cd logs; bash"'
alias wt1='ssh -t logviewer@10.200.70.46   "cd logs; bash"'
alias wt2='ssh -t logviewer@10.200.70.47   "cd logs; bash"'
alias wtm='ssh -t logviewer@10.200.70.48   "cd logs; bash"'
alias wt3='ssh -t logviewer@10.200.70.30   "cd logs; bash"'
alias wt4='ssh -t logviewer@10.200.70.31   "cd logs; bash"'
alias wp1='ssh -t logviewer@10.200.69.210  "cd logs; bash"'
alias wp2='ssh -t logviewer@10.200.69.211  "cd logs; bash"'
alias wpm='ssh -t logviewer@10.200.69.209  "cd logs; bash"'

alias td='tmuxinator start wso2devlog'
alias tt='tmuxinator start wso2preplog'
alias tp='tmuxinator start wso2prodlog'

# WSO2 Baltics
alias wbalcmnd='ssh bernard.el-hagin@baltics-cmndev-wso2-as'
alias wbalctrd='ssh bernard.el-hagin@baltics-ctrdev-wso2-as'

alias wso2='ssh Bernard.El-Hagin@10.111.250.167'

# WSO2 aliases
alias esb='$HOME/Devel/wso2ei-6.3.0/bin/integrator.sh'

# ]]]
