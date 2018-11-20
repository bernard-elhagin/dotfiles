# Kafka SSH aliases
KAFKA_DEV_MGT='dev-kafka-mgt01'
KAFKA_QA_MGT='test-kafka-mgt01'
KAFKA_TEST_MGT='10.200.53.54'
KAFKA_FIX_MGT='10.200.53.61'
KAFKA_PROD_MGT='10.200.43.54'

alias kd="ssh bernard.elhagin@$KAFKA_DEV_MGT"
alias kq="ssh bernardelh@$KAFKA_QA_MGT"
alias kf="ssh bernard.elhagin@$KAFKA_FIX_MGT"
alias kt="ssh bernard.elhagin@$KAFKA_TEST_MGT"
alias kp="ssh bernard.elhagin@$KAFKA_PROD_MGT"

# WSO2 SSH aliases
alias wd1='ssh -t logviewer@10.111.230.247 "cd logs; bash"'
alias wd2='ssh -t logviewer@10.111.230.248 "cd logs; bash"'
alias wdm='ssh -t logviewer@10.111.230.249 "cd logs; bash"'
alias wt1='ssh -t logviewer@10.200.70.46   "cd logs; bash"'
alias wt2='ssh -t logviewer@10.200.70.47   "cd logs; bash"'
alias wtm='ssh -t logviewer@10.200.70.48   "cd logs; bash"'
alias wp1='ssh -t logviewer@10.200.69.210  "cd logs; bash"'
alias wp2='ssh -t logviewer@10.200.69.211  "cd logs; bash"'
alias wpm='ssh -t logviewer@10.200.69.209  "cd logs; bash"'

alias wso2='ssh Bernard.El-Hagin@10.111.250.167'

# WSO2 aliases
alias esb='$HOME/Devel/wso2ei-6.3.0/bin/integrator.sh'

# Kafka aliases
KCC1='kafka-console-consumer.sh --bootstrap-server '
KCC2=' --topic notify.claims.claim.claim_change.mob_client.claim_lite --from-beginning --consumer.config $HOME/kafka/config/client-ssl.properties'
KCP1='kafka-console-producer.sh --broker-list '
KCP2=' --topic notify.claims.claim.claim_change.mob_client.claim_lite --producer.config $HOME/kafka/config/client-ssl.properties'

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

# Package manager aliases
alias pacman='pacman --color=always'
alias pss='pacman -Ss'
alias pS='sudo pacman -S'
alias yss='yaourt -Ss'
alias ys='yaourt -S'
alias pfiles='pacman -Fl'
