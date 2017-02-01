#!/usr/bin/env bash

cp ../target/* supplied/

docker build --tag akquinet/mlc-go:1.0 .