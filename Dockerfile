# Use an official Node.js image as the base
FROM node:20-alpine
# Set the working directory in the container
WORKDIR /app
# Copy the package.json and package-lock.json files to install dependencies
COPY my-app/package.json my-app/package-lock.json ./
# Install dependencies including react-scripts
RUN npm install -g npm@10.9.0 
# Copy the rest of the application code to the working directory
COPY my-app/ ./
# Expose the application port
EXPOSE 3000
# Start the application using 'serve'
CMD ["npm", "start"]
