# Stage 1: Build the application using Node.js
# Use the official Node.js image (alpine version for a smaller footprint)
FROM node:16-alpine AS build

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
# This step is separated to leverage Docker's layer caching
COPY package*.json ./

# Install only production dependencies to reduce image size
RUN npm install --only=production

# Copy the rest of the application code to the container
COPY . .

# Build the React application for production
RUN npm run build

# Stage 2: Serve the application with nginx
# Use nginx to serve the built application in a lightweight image
FROM nginx:alpine

# Copy the build output from the first stage to the nginx html directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose the port that nginx will use to serve the application
EXPOSE 80

# Default command to start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
