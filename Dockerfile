FROM node:20-alpine
# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./my-app

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the port for the app
EXPOSE 3000

# Run the app
CMD ["npm", "start"]
