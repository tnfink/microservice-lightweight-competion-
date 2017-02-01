#!/usr/bin/env bash

cp target/* mlc-go-docker/supplied/

cd mlc-go-docker/

docker build --tag akquinet/mlc-go:1.0 .