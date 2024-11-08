#!/bin/bash

# Create ConfigMap for nginx configuration
kubectl create configmap nginx-config --from-literal=nginx.conf='
events { }
http {
  server {
    listen 80;
    location / {
      proxy_pass http://backend-service:8080;
    }
  }
}
'

# Apply all Kubernetes resources
# Create backend deployment
kubectl create deployment backend-deployment --image=nginx:latest --replicas=1 --port=80 \
  --dry-run=client -o yaml | kubectl set resources --local -f - \
  --limits=cpu=500m,memory=512Mi --requests=cpu=200m,memory=256Mi | kubectl apply -f -

# Create backend service
kubectl expose deployment backend-deployment --name=backend-service --port=8080 --target-port=80

# Create frontend deployment
kubectl create deployment frontend-deployment --image=nginx:latest --replicas=1 --port=80
kubectl set volume deployment/frontend-deployment --add --name=nginx-config-volume --mount-path=/etc/nginx/nginx.conf --sub-path=nginx.conf --configmap-name=nginx-config

# Wait for deployments to be ready
echo "Waiting for deployments to be ready..."
kubectl wait --for=condition=available deployment/backend-deployment --timeout=60s
kubectl wait --for=condition=available deployment/frontend-deployment --timeout=60s

# Show status
echo "Deployment Status:"
kubectl get pods
kubectl get services 