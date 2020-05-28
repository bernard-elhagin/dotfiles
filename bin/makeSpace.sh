#!/usr/bin/bash

export MAVEN_OPTS=" -Duser.language=pl -Duser.region=PL"

mvn -version

rm ~/Devel/wso2ei-6.5.0/repository/deployment/server/carbonapps/pl.atena.claim.identifiers.deploy_1.0.0.car

cd ~/Devel/Projects/space-esb-eb/pl.atena.claim/pl.atena.claim.identifiers/ || exit
mvn clean install

cp ~/Devel/Projects/space-esb-eb/pl.atena.claim/pl.atena.claim.identifiers/pl.atena.claim.identifiers.deploy/target/pl.atena.claim.identifiers.deploy_1.0.0.car ~/Devel/wso2ei-6.5.0/repository/deployment/server/carbonapps
