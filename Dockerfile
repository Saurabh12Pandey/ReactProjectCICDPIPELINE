# Use an official Node.js image as the base
FROM node:20-alpine

# Set environment to suppress npm deprecation warnings
ENV npm_config_loglevel=error

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to install dependencies
COPY my-app/package.json my-app/package-lock.json ./

# Install npm globally, react-scripts, and handle peer dependencies
RUN npm install -g npm@10.9.0 && \
    npm install react-scripts@latest rimraf@latest core-js@3 fs-extra@latest --legacy-peer-deps && \
    npm install --legacy-peer-deps

# Copy the rest of the application code to the working directory
COPY my-app/ ./

# Expose the application port (React uses 3000 by default)
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
