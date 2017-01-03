FROM jboss/base-jdk:8

ADD  mlc-wildfly-swarm.jar /app/mlc-wildfly-swarm.jar

EXPOSE 8080

ENTRYPOINT $JAVA_HOME/bin/java -jar /app/mlc-wildfly-swarm.jar