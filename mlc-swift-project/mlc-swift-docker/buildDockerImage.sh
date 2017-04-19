#!/usr/bin/env bash

rm -rf supplied/
cp -R ../mlc-swift-microservice/ supplied/

docker build --tag akquinet/mlc-swift:1.0 .
