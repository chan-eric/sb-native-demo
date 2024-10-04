# Using Oracle GraalVM for JDK 17
FROM ghcr.io/graalvm/graalvm-ce:latest as builder

# Set the working directory to /home/app
WORKDIR /build

# Copy the source code into the image for building
COPY . /build

# Build the native image
RUN ./mvnw --no-transfer-progress native:compile -Pnative

# The deployment Image
# Create a smaller runtime image, the runtime is targetted toward the following OS, you can specify OS, ie "FROM ubuntu:22.04"
FROM container-registry.oracle.com/os/oraclelinux:8-slim

# Copy the native image from the builder stage into the containers
COPY --from=builder /build/target/demo /app/

ENTRYPOINT ["app/demo"]
