#!/usr/bin/bash

export MAVEN_OPTS=" -Duser.language=pl -Duser.region=PL"

mvn -version

rm ~/Devel/wso2ei-6.5.0/repository/deployment/server/carbonapps/pl.atena.document.egida.deploy_1.0.4.car

cd ~/Devel/Projects/space-esb-eb/pl.atena.document/pl.atena.document.egida/
mvn clean install

cp ~/Devel/Projects/space-esb-eb/pl.atena.document/pl.atena.document.egida/pl.atena.document.egida.deploy/target/pl.atena.document.egida.deploy_1.0.4.car ~/Devel/wso2ei-6.5.0/repository/deployment/server/carbonapps
