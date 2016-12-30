#!/usr/bin/env bash

function log {
    echo =============
    echo $1
    echo =============
}

function echoSizeOfFile {
    wc -c $1 | cut -d " " -f 2
}

function countAllLOCs {
    find $1 \( -name "*.java" -or -name "*.xml" \) -exec cat "{}" \; | wc -l
}

pushd ../../../

log "Build project"

#mvn clean
#mvn install

SPRINGBOOT_MS_DIR=mlc-springboot-project/mlc-springboot-microservice
WILDFLY_MS_DIR=mlc-wildflyswarm-project/mlc-wildflyswarm-microservice

log "Measure sizes of Jars"

echo Spring-Boot
echoSizeOfFile ${SPRINGBOOT_MS_DIR}/target/mlc-springboot-microservice-1.0-SNAPSHOT.jar

echo Wildfly-Swarm
echoSizeOfFile ${WILDFLY_MS_DIR}/target/mlc-wildflyswarm-microservice-1.0-SNAPSHOT-swarm.jar

log "Measure LOCs"

echo Spring-Boot
countAllLOCs ${SPRINGBOOT_MS_DIR}

echo Wildfly-Swarm
countAllLOCs ${WILDFLY_MS_DIR}


log Done

popd