#!/usr/bin/env bash

docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app golang:1.7-alpine \
    go build -o target/adderMicroservice mlc-go-microservice/adderMicroservice/main.go

