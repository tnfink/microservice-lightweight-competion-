# FROM fpco/stack-run:lts-7.14 # the recommended base image
FROM phusion/baseimage:0.9.19

ADD supplied/mlc-snap-microservice-exe /local/bin/mlc-snap-microservice-exe

EXPOSE 8000

ENTRYPOINT /local/bin/mlc-snap-microservice-exe