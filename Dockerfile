FROM maven:3-openjdk-11 AS base

# BUILD
FROM base as build

COPY src /build/src
COPY pom.xml /build/pom.xml

WORKDIR /build

RUN mvn package
RUN ls /build/target/


# DEPLOY
FROM scratch AS export
COPY --from=build /build/target/*.jar /

