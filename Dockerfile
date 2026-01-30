# Use lightweight Node.js image
FROM node:18-alpine

# Create app directory
WORKDIR /usr/src/app

# Copy package files first (for caching)
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy app source code
COPY . .

# App runs on port 3000
EXPOSE 3000

# Start the app
CMD ["node", "app.js"]
