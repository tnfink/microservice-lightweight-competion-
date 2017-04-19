FROM ibmcom/swift-ubuntu:latest
MAINTAINER Martin Schröder
LABEL Description="Docker image for building and running the mlcSwiftMicroservice application on Kitura HTTP Server"

# Expose default port for Kitura
EXPOSE 8080

ADD supplied/ /root/mlc-swift-microservice

RUN cd /root/mlc-swift-microservice && swift build

USER root
CMD [ "sh", "-c", "/root/mlc-swift-microservice/.build/debug/mlcSwiftMicroservice" ]
