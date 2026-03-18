# Use Node.js image to ensure npm is available
FROM node:18-alpine

# Set working directory inside container
WORKDIR /app

# Copy all project files to the container
COPY . .

# Install and build Frontend
# This fixes the "npm: command not found" error
RUN cd frontend && npm install && npm run build

# Install Backend dependencies
RUN cd backend && npm install

# Set production environment
ENV NODE_ENV=production

# Expose the backend port (default 5000 based on DEPLOYMENT.md)
EXPOSE 5000

# Start the backend server
WORKDIR /app/backend
CMD ["npm", "start"]