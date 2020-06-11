FROM openjdk:8-jre-alpine

RUN mkdir /sample_project
#WORKDIR "/Users"
#WORKDIR ~/

COPY sample.jar /sample_project/sample.jar


CMD java -jar /sample_project/sample.jar

