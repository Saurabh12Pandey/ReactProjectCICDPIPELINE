# Use an official Node.js image
FROM node:20-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and install dependencies
COPY my-app/package.json my-app/package-lock.json ./
RUN npm install

# Copy the rest of the application code
COPY my-app/ ./

# Expose the application port
EXPOSE 8000

# Define the command to run your application
CMD ["npm", "start"]
