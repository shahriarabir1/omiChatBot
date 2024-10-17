# Use a base image with Java JDK 21
FROM openjdk:21-jdk

# Set the working directory
#WORKDIR /app

# Copy the Maven or Gradle build files
#COPY pom.xml ./
#COPY src ./src
#
## Build the application (make sure mvnw is executable)
#RUN ./mvnw clean package -DskipTests
#
## Create a new stage for the final image
#FROM openjdk:21-jre
#
## Set the working directory
#WORKDIR /app
#
## Copy the built JAR file from the build stage
#COPY --from=build /app/target/*.jar chatbot-raqamiUniverse.jar
#COPY

ADD ./chatbot-raqamiUniverse.jar chatbot-raqamiUniverse.jar
RUN apt-get update && apt-get install -y \
    curl \
    && curl -sSL https://ollama.com/download.sh | sh

# Run the Llama 2 model in the background
# This command will run Ollama with the Llama 2 model
# Adjust the command based on how you intend to use the model
CMD ["ollama", "run", "llama2"]
ENTRYPOINT ["java","-jar","chatbot-raqamiUniverse.jar"]
# Expose the application port
#EXPOSE 8080
#
## Command to run the application
#ENTRYPOINT ["java", "-jar", "chatbot-raqamiUniverse.jar"]
