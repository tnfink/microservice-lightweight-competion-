#!/usr/bin/env bash

function log {
    echo =============
    echo $1
    echo =============
}

function echoSizeOfFile {
    wc -c $1
}

function countAllLOCs {
    find $1 \( -name "*.java" -or -name "*.xml" -or -name "*.xml" -or -name "*.yaml" -or -name "*.go" -or -name "*.hs" \) -exec cat "{}" \; | wc -l
}

function countAllRelevantLOCsSwift {
    find $1 \( -name "*.swift" -not -path "*/.build/*" \) -exec cat "{}" \; | wc -l
}

pushd ../../../

# log "Build project"

mvn clean
mvn install

SPRINGBOOT_MS_DIR=mlc-springboot-project/mlc-springboot-microservice
WILDFLY_SWARM_MS_DIR=mlc-wildflyswarm-project/mlc-wildflyswarm-microservice
WILDFLY_MS_DIR=mlc-wildfly-project/mlc-wildfly-microservice
SNAP_MS_DIR=mlc-snap-project/mlc-snap-microservice
GO_MS_DIR=mlc-go-project/mlc-go-microservice
SWIFT_MS_DIR=mlc-swift-project/mlc-swift-microservice

log "Measure sizes of Executables"

echo Spring-Boot
echoSizeOfFile ${SPRINGBOOT_MS_DIR}/target/mlc-springboot-microservice-1.0-SNAPSHOT.jar

echo Wildfly
echoSizeOfFile ${WILDFLY_MS_DIR}/target/mlc-wildfly-microservice-1.0-SNAPSHOT.war

echo Wildfly-Swarm
echoSizeOfFile ${WILDFLY_SWARM_MS_DIR}/target/mlc-wildflyswarm-microservice-1.0-SNAPSHOT-swarm.jar

echo Snap
echoSizeOfFile ${SNAP_MS_DIR}/.stack-work/docker/_home/.local/bin/*

echo Go
echoSizeOfFile ${GO_MS_DIR}/../target/*

echo Swift
echoSizeOfFile ${SWIFT_MS_DIR}/.build/debug/mlc-swift-microservice

log "Measure LOCs"

echo Spring-Boot
countAllLOCs ${SPRINGBOOT_MS_DIR}

echo Wildfly
countAllLOCs ${WILDFLY_MS_DIR}

echo Wildfly-Swarm
countAllLOCs ${WILDFLY_SWARM_MS_DIR}

echo Snap
countAllLOCs ${SNAP_MS_DIR}
echo "-- minus"
countAllLOCs ${SNAP_MS_DIR}/.stack-work

echo Go
countAllLOCs ${GO_MS_DIR}

echo Swift
countAllRelevantLOCsSwift ${SWIFT_MS_DIR}

log Done

popd
