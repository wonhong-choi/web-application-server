FROM ubuntu:22.04

WORKDIR /app

COPY . .

EXPOSE 8080

RUN apt-get update && apt-get install -y \
    tzdata \
    curl

# JDK 25
RUN apt install -y openjdk-25-jdk

# Maven
RUN apt install -y maven

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul

RUN mvn clean package

ENTRYPOINT ["java", "-cp", "target/classes:target/dependency/*", "webserver.WebServer", "8080"]
