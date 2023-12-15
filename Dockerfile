


#
# Build stage
#
#   FROM maven:3.8.4-openjdk-11-slim AS build
#   COPY /service /home/app/service
#   COPY pom.xml /home/app
#   RUN mvn -f /home/app/pom.xml clean package
# # #
# # # #
# # # # Package stage
# # # #
#   FROM openjdk:11-jdk-oracle
#   COPY --from=build /home/app/service/target/*.jar /usr/local/lib/nginx0-deployment.jar
#   EXPOSE 8080
#   ENTRYPOINT ["java","-jar","/usr/local/lib/nginx0-deployment.jar"]





#Build
FROM maven:3.8.3-openjdk-17 as build

WORKDIR /home/app
COPY . /home/app
RUN mvn clean package -DskipTests=true

#Package
FROM openjdk:17-alpine

copy --from=build /home/app/target/*.jar /usr/local/lib/query-service.jar
EXPOSE 8080

ENTRYPOINT ["java","-jar","/usr/local/lib/query-service.jar"]

