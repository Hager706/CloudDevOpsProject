# Start with a base image that has Java and Gradle
FROM gradle:7.6.2-jdk17-jammy AS builder
# Set working directory
WORKDIR /app

# Copy gradle configuration files
COPY web-app/build.gradle web-app/settings.gradle ./
COPY web-app/gradle ./gradle

# Copy source code
COPY web-app/src ./src

# Build the application
RUN gradle build --no-daemon

# Create a new stage with just the JRE to run the application
FROM eclipse-temurin:17-jre-jammy AS runtime
# Set working directory
WORKDIR /app

# Copy the built JAR file from the builder stage
COPY --from=builder /app/build/libs/*.jar app/ 
# Expose the port the app runs on
EXPOSE 8081

# Command to run the application
CMD ["java", "-jar", "app.jar"]