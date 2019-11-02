FROM openjdk
WORKDIR /
COPY sample-web-ui.jar sample-web-ui.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dserver.port=8081","-Dserver.servlet.context-path=/ui","-jar","/sample-web-ui.jar"]
