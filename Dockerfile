# Use the official Node.js 18 image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Install dependencies for fetching and running Supabase CLI
RUN apt-get update && apt-get install -y curl

# Download and install Supabase CLI
RUN curl -L https://github.com/supabase/cli/releases/latest/download/supabase-linux-x64 -o /usr/local/bin/supabase
RUN chmod +x /usr/local/bin/supabase

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install npm dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port on which the application will run
EXPOSE 3000

# Set the command to run the application
CMD ["npm", "run", "chat"]
