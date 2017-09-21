FROM ibmcom/swift-ubuntu-runtime:4.0
LABEL Description="Docker image for running the mlcSwiftMicroservice application on Kitura HTTP Server"

# Expose default port for Kitura
EXPOSE 8080

USER root

RUN mkdir /root/mlcSwiftMicroservice

ADD .build/debug/mlcSwiftMicroservice /root/mlcSwiftMicroservice/
#ADD .build/debug/*.so /root/mlcSwiftMicroservice/

CMD [ "sh", "-c", "/root/mlc-swift-microservice/mlcSwiftMicroservice" ]
