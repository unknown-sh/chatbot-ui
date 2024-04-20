# Use the official Node.js image as the base
FROM node:14

# Set the working directory
WORKDIR /app

# Copy package.json and lock file
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Expose the application port
EXPOSE 3000

# Command to run the app
CMD ["npm", "start"]
