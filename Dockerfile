# Use an official Node.js image as the base
FROM node:20-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to install dependencies
COPY my-app/package.json my-app/package-lock.json ./

# Install dependencies
RUN npm install -g npm@10.9.0

# Copy the rest of the application code to the working directory
COPY my-app/ ./

# Build the React application for production
RUN npm run build

# Install 'serve' globally to serve the production build
RUN npm install -g serve

# Expose the application port
EXPOSE 8000

# Start the application using 'serve'
CMD ["serve", "-s", "build", "-l", "8000"]
