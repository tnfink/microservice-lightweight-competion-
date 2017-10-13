#!/usr/bin/env bash

function log {
    echo =============
    echo $1
    echo =============
}

function echoSizeOfFile {
    wc -c $1
}

function countAllLOCsJava {
    find $1 \( -not -path "*/target/*" \) -and \( -name "*.java" -or -name "*.xml" \) -exec cat "{}" \; | wc -l
}

function countAllLOCsHaskell {
    find $1 \( -not -path "*/.stack-work/*" \) -and \( -name "*.yaml" -or -name "*.cabal" -or -name "*.hs"  \) -exec cat "{}" \; | wc -l
}

function countAllLOCsGo {
    find $1 \( -name "*.go" \) -exec cat "{}" \; | wc -l
}

function countAllRelevantLOCsSwift {
    find $1 \( -not -path "*/.build/*" \) -and  \( -name "*.swift"  \) -exec cat "{}" \; | wc -l
}

pushd ../../../

# log "Build project"
#mvn clean
#mvn install

# --------------------

SPRINGBOOT_MS_DIR=mlc-springboot-project/mlc-springboot-microservice/
WILDFLY_SWARM_MS_DIR=mlc-wildflyswarm-project/mlc-wildflyswarm-microservice/
WILDFLY_MS_DIR=mlc-wildfly-project/mlc-wildfly-microservice/
SNAP_MS_DIR=mlc-snap-project/mlc-snap-microservice/
GO_MS_DIR=mlc-go-project/mlc-go-microservice/
SWIFT_MS_DIR=mlc-swift-project/

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
countAllLOCsJava ${SPRINGBOOT_MS_DIR}

echo Wildfly
countAllLOCsJava ${WILDFLY_MS_DIR}

echo Wildfly-Swarm
countAllLOCsJava ${WILDFLY_SWARM_MS_DIR}

echo Snap
countAllLOCsHaskell ${SNAP_MS_DIR}

echo Go
countAllLOCsGo ${GO_MS_DIR}

echo Swift
countAllRelevantLOCsSwift ${SWIFT_MS_DIR}/src/main/swift

log Done

popd
