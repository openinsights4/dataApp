# Use the official Node.js image as the base (alpine version for a smaller footprint)
FROM node:16-alpine AS build

# Set the working directory inside the container
WORKDIR /app

# Copy only the package.json and package-lock.json to leverage Docker's cache layer
COPY package*.json ./

# Install only production dependencies (this speeds up and reduces image size)
RUN npm install --only=production

# Copy the rest of the application code into the container
COPY . .

# Build the application for production
RUN npm run build

# Second stage: use nginx to serve the built application (multi-stage build)
FROM nginx:alpine

# Copy the built application from the previous stage to the nginx directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose the port that nginx will serve on
EXPOSE 80

# Default command to start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
