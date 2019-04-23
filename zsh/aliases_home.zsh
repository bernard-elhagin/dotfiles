# Kafka SSH aliases
KAFKA_DEV_MGT='dev-kafka-mgt01'
KAFKA_QA_MGT='test-kafka-mgt01'
KAFKA_TEST_MGT='10.200.53.54'
KAFKA_SZKOL_MGT='10.200.53.34'
KAFKA_FIX_MGT='10.200.53.61'
KAFKA_PROD_MGT='10.200.43.54'

alias kd="ssh bernard.elhagin@$KAFKA_DEV_MGT"
alias kq="ssh bernardelh@$KAFKA_QA_MGT"
alias kf="ssh bernard.elhagin@$KAFKA_FIX_MGT"
alias kt="ssh bernard.elhagin@$KAFKA_TEST_MGT"
alias ks="ssh bernard.elhagin@$KAFKA_SZKOL_MGT"
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

alias td='tmuxinator start wso2devlog'
alias tt='tmuxinator start wso2preplog'
alias tp='tmuxinator start wso2prodlog'

# WSO2 Baltics
alias wbalcmnd='ssh bernard.el-hagin@baltics-cmndev-wso2-as'
alias wbalctrd='ssh bernard.el-hagin@baltics-ctrdev-wso2-as'

alias wso2='ssh Bernard.El-Hagin@10.111.250.167'

# WSO2 aliases
alias esb='$HOME/Devel/wso2ei-6.3.0/bin/integrator.sh'

# Start local kafka
alias kafkarun='sudo kafka-server-start.sh /opt/kafka/config/server.properties'
alias zoorun='sudo zookeeper-server-start.sh /opt/kafka/config/zookeeper.properties'

# Package manager aliases
alias pacman='pacman --color=always'
alias pss='pacman -Ss'
alias pS='sudo pacman -S'
alias yss='yaourt -Ss'
alias ys='yaourt -S'
alias pfiles='pacman -Fl'
