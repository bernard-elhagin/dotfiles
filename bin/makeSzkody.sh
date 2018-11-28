#!/usr/bin/bash

rm ~/Devel/wso2esb-4.9.0/repository/deployment/server/carbonapps/pl.atena.iszkody.deploy_1.0.0.car

cd ~/Devel/Projects/iszkody-esb/pl.atena.iszkody
mvn clean install

cp ~/Devel/Projects/iszkody-esb/pl.atena.iszkody/pl.atena.iszkody.deploy/target/pl.atena.iszkody.deploy_1.0.0.car \
   ~/Devel/wso2esb-4.9.0/repository/deployment/server/carbonapps/
