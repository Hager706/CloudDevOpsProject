## Overview of the Project

This is a small Java web application built with Spring Boot framework. The application shows a simple webpage that displays "iVolve Technologies" and "Hello, Spring Boot NTI" along with the server's IP address. The project also includes a basic `MathService` class with unit tests.

## Key Technologies

1. **Java**: The programming language used for the application
2. **Spring Boot (v2.6.3)**: A framework that simplifies developing Java applications
3. **Gradle (v7.3.3)**: Build automation tool for compiling and packaging the application
4. **JUnit**: Testing framework for writing and running unit tests
5. **Thymeleaf**: Templating engine for rendering HTML views
6. **Docker**: Container platform 

## Project Structure

- `build.gradle`: Configuration file for the Gradle build tool
- `src/main/java`: Contains Java source code
  - `DemoApplication.java`: The main entry point for the Spring Boot application
  - `MathService.java`: A service with basic math operations
  - `controller/HomeController.java`: Web controller that handles HTTP requests
- `src/main/resources`: Contains application configuration and resources
  - `application.properties`: Application configuration (port settings, etc.)
  - `templates/index.html`: The HTML template for the home page
- `src/test`: Contains test code
  - `MathServiceTest.java`: Unit tests for the math service

## How the Application Works

1. When started, `DemoApplication.java` bootstraps the Spring application
2. The application serves web content on port 8081 (configured in `application.properties`)
3. When a user visits the root URL ("/"), `HomeController.java` handles the request
4. The controller gets the server's IP address and passes it to the view
5. The view (`index.html`) renders a simple page showing the IP address

## Dockerfile Overview

### **First Stage: Builder**
- Uses the `gradle:jdk17-jammy` image to build the application.
- Copies only necessary files (Gradle config and source code).
- Builds the application using Gradle.

### **Second Stage: Runtime**
- Uses a lightweight **JRE** image to run the application.
- Copies only the built `.jar` file from the builder stage.
- Exposes port `8081`.
- Sets the command to run the application.

---

##  Benefits of This Approach
- 🔹 **Smaller final image size** — build tools are excluded.
- 🔹 **Improved security** — fewer unnecessary components.
- 🔹 **Faster deployment** — optimized container performance.

---

## How to Build and Run

### 1 Build the Docker image
```bash
docker build -t ivolve-app .
```
### 2 Run the Docker container
```bash
docker run -p 8081:8081 ivolve-app
```
The application will be available at:
➡️ http://localhost:8081
![Alt text](assets/pic1.png)


