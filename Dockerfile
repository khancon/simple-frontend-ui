# Use an official Node.js runtime as a parent image
FROM node:14-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install http-server globally
RUN npm install -g http-server

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run http-server when the container launches
CMD ["http-server", "-p", "8000"]
