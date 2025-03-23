FROM openjdk:11-jdk-slim

WORKDIR /app

# Copy the JAR file
COPY build/libs/demo-0.0.1-SNAPSHOT.jar app.jar

# Expose the port the app runs on
EXPOSE 8081

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]