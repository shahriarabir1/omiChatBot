# Use a base image with Java JDK 21
FROM openjdk:21-jdk-slim AS build

# Set the working directory
WORKDIR /app

# Copy the Maven or Gradle build files
COPY pom.xml ./
COPY src ./src

# Build the application (make sure mvnw is executable)
RUN ./mvnw clean package -DskipTests

# Create a new stage for the final image
FROM openjdk:21-jre-slim

# Set the working directory
WORKDIR /app

# Copy the built JAR file from the build stage
COPY --from=build /app/target/*.jar chatbot-raqamiUniverse.jar

# Expose the application port
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
