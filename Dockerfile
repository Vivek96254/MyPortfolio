# Use a minimal Node.js image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy only package.json and package-lock.json first (for better caching)
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project
COPY . .

# Build the Next.js application
RUN npm run build

# Expose port 3000 (Next.js default port)
EXPOSE 3000

# Start the application in production mode
CMD ["npm", "run", "start"]
