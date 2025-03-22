## Overview of the Project

This is a small Java web application built with Spring Boot framework. The application shows a simple webpage that displays "iVolve Technologies" and "Hello, Spring Boot NTI" along with the server's IP address. The project also includes a basic `MathService` class with unit tests.

## Key Technologies

1. **Java**: The programming language used for the application
2. **Spring Boot (v2.6.3)**: A framework that simplifies developing Java applications
3. **Gradle (v7.3.3)**: Build automation tool for compiling and packaging the application
4. **JUnit**: Testing framework for writing and running unit tests
5. **Thymeleaf**: Templating engine for rendering HTML views
6. **Docker**: Container platform (mentioned in README.md but not shown in the files)

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

## The Process (Based on README.md)

The manual steps mentioned in the README describe a typical development workflow:

1. Run unit tests to verify the code works correctly
2. Build a JAR file (Java ARchive) containing the compiled application
3. Run the application locally to test it
4. Create a Dockerfile to define how to containerize the application
5. Build a Docker image from the Dockerfile
6. Run the Docker container
7. Verify the application works in the container

## Testing

The application includes unit tests for the `MathService` class, testing basic math operations (add, subtract, multiply, divide) and handling division by zero errors.
