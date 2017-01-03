#!/usr/bin/env bash

cp ../mlc-snap-microservice/.stack-work/docker/_home/.local/bin/* supplied/

docker build --tag akquinet/mlc-snap:1.0 .