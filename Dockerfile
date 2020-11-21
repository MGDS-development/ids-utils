FROM maven:3-openjdk-11 AS base

# BUILD
FROM base as build
WORKDIR /build

COPY pom.xml /build/pom.xml
RUN mvn dependency:go-offline

COPY src /build/src

RUN mvn package
RUN ls /build/target/


# DEPLOY
FROM scratch AS export
COPY --from=build /build/target/*.jar /

