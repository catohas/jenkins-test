# Use an official Node.js runtime as a parent image
FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the rest of the application code to the container
COPY . .

# Install dependencies
RUN npm install

# Install PM2 globally
RUN npm install pm2 -g

# Start the application using PM2
CMD ["pm2-runtime", "index.js"]

