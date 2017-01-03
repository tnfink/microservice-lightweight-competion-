# FROM jboss/base-jdk:8 # this is the recommended jdk for the Wildfly app server
FROM openjdk:8-jdk-alpine

ADD  mlc-wildfly-swarm.jar /app/mlc-wildfly-swarm.jar

EXPOSE 8080

ENTRYPOINT $JAVA_HOME/bin/java -jar /app/mlc-wildfly-swarm.jar