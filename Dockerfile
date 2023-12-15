


#
# Build stage
#
#  FROM maven:3.8.4-openjdk-11-slim AS build
#  COPY /service /home/app/service
#  COPY pom.xml /home/app
#  RUN mvn -f /home/app/pom.xml clean package
# #
# # #
# # # Package stage
# # #
#  FROM openjdk:11-jdk-oracle
#  COPY --from=build /home/app/service/target/*.jar /usr/local/lib/app.jar
#  EXPOSE 8080
#  ENTRYPOINT ["java","-jar","/usr/local/lib/app.jar"]





# Use the official OpenJDK 11 image as a base image
FROM openjdk:11-jdk-oracle

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file into the container at /app
COPY target/service-0.0.1-SNAPSHOT.jar /app/

# Expose the port that your Spring Boot app runs on
EXPOSE 8080

# Specify the command to run your application
CMD ["java", "-jar", "service-0.0.1-SNAPSHOT.jar"]
