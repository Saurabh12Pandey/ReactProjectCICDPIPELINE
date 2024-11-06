# Use an official Node.js image
FROM node:20-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY my-app/package.json my-app/package-lock.json ./

# Install only production dependencies, ignoring optional dependencies to avoid issues
RUN npm install -g npm@10.9.0

# Copy the rest of the application code after dependencies are installed
COPY my-app/ ./

# Expose the application port
EXPOSE 8000

# Define the command to run your application
CMD ["npm", "start"]

