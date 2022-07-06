FROM openjdk:11
RUN mkdir /opt/app
COPY target/*.jar /opt/app
