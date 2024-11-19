FROM alpine:latest

# Install dependencies (Node.js and Tor)
RUN apk update && \
    apk add --no-cache nodejs tor bash

# Set the working directory
WORKDIR /service

# Copy the application files into the container
COPY . /service

# Ensure the main.sh script is executable
RUN chmod +x /service/main.sh

# Expose the port (adjust as necessary for your app)
EXPOSE 80

# Run the script (ensure it's executable and has the right shebang)
CMD ./main.sh
