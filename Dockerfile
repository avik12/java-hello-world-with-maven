FROM openjdk:11
RUN mkdir /opt/app
COPY target/*.jar /opt/app/
CMD ["java", "-jar", "/opt/app/jb-hello-world-maven-0.2.0-shaded.jar"]

