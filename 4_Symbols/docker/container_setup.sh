#!/bin/bash

# Create a custom network for container communication
docker network create symbols-net

# Create nginx config directory and file
mkdir -p nginx-config
cat > nginx-config/nginx.conf << 'EOF'
events { }
http {
  server {
    listen 80;
    location / {
      proxy_pass http://backend:8080;
    }
  }
}
EOF

# Start backend container
docker run -d \
  --name backend \
  --network symbols-net \
  --cpus=0.5 \
  --memory=512m \
  -p 8080:80 \
  nginx:latest

# Start frontend container
docker run -d \
  --name frontend \
  --network symbols-net \
  -p 80:80 \
  -v $(pwd)/nginx-config/nginx.conf:/etc/nginx/nginx.conf:ro \
  nginx:latest 