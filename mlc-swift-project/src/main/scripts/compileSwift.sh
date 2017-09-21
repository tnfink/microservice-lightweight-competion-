#!/usr/bin/env bash

TARGET_DIR=/root/mlcSwiftMicroservice
SOURCE_DIR=target/docker

mkdir -p $SOURCE_DIR
cp -f src/main/swift/*.swift $SOURCE_DIR

echo "cd $TARGET_DIR; swift build" > $SOURCE_DIR/build.sh

docker run -v `pwd`/$SOURCE_DIR:$TARGET_DIR ibmcom/swift-ubuntu:4.0 sh /root/mlcSwiftMicroservice/build.sh