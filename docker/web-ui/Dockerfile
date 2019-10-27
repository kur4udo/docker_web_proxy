FROM openjdk
WORKDIR /
COPY sample-web-ui.jar sample-web-ui.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dserver.port=8081","-jar","/sample-web-ui.jar"]
