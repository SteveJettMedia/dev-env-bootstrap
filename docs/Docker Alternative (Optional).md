---
source:
  - - Complete Development Environment Setup Guide
created: 2025-06-28
---
# Docker Alternative (Optional)

> Extracted from [[Complete Development Environment Setup Guide]] on 2025-06-28

---

### Docker Alternative (Optional)

#### Create Dockerfile for Consistency

Save as `~/projects/Dockerfile.eleventy`:

```dockerfile
FROM node:18-alpine

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm ci

# Copy project files
COPY . .

# Expose port
EXPOSE 8080

# Start development server
CMD ["npm", "run", "dev"]
```

#### Docker Compose for Development

Save as `~/projects/docker-compose.yml`:

```yaml
version: '3.8'

services:
  eleventy:
    build:
      context: .
      dockerfile: Dockerfile.eleventy
    volumes:
      - .:/app
      - /app/node_modules
    ports:
      - "8080:8080"
    environment:
      - NODE_ENV=development
```


---

← Back to [[Complete Development Environment Setup Guide]]
