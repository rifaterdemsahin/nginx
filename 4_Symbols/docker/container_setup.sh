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
  --name frontend1 \
  --network symbols-net \
  -p 80:80 \
  -v /workspaces/nginx/4_Symbols/docker/nginx-config/nginx.conf:/etc/nginx/nginx.conf:ro \
  nginx:latest 


@rifaterdemsahin ➜ /workspaces/nginx (main) $ docker ps
CONTAINER ID   IMAGE                                 COMMAND                  CREATED              STATUS              PORTS                                                                                                                                  NAMES
976afbae3174   nginx:latest                          "/docker-entrypoint.…"   19 seconds ago       Up 18 seconds       0.0.0.0:80->80/tcp, :::80->80/tcp                                                                                                      frontend1
96be76bcea14   nginx:latest                          "/docker-entrypoint.…"   About a minute ago   Up About a minute   0.0.0.0:8080->80/tcp, :::8080->80/tcp                                                                                                  backend
2c78dbf3462a   gcr.io/k8s-minikube/kicbase:v0.0.45   "/usr/local/bin/entr…"   26 minutes ago       Up 26 minutes       127.0.0.1:32768->22/tcp, 127.0.0.1:32769->2376/tcp, 127.0.0.1:32770->5000/tcp, 127.0.0.1:32771->8443/tcp, 127.0.0.1:32772->32443/tcp   minikube
@rifaterdemsahin ➜ /workspaces/nginx (main) $ 


# Send a request from frontend to backend
docker exec frontend1 curl -s http://backend:8080
