# Objective and Key Results

## Objective
Create frontend and backend deployments with a service and demonstrate their access.

## Key Results
1. **Backend Deployment**
    - Create a backend deployment using `nginx:latest` image.
    - Ensure the backend deployment has resource limits and requests defined.
    - Verify the backend deployment is running successfully.

2. **Backend Service**
    - Create a service for the backend deployment.
    - Ensure the service exposes port 8080 and targets port 80 of the backend container.
    - Verify the service is accessible within the cluster.

3. **Frontend Deployment**
    - Create a frontend deployment using `nginx:latest` image.
    - Mount the `nginx.conf` configuration file from a ConfigMap.
    - Verify the frontend deployment is running successfully.

4. **Frontend Service**
    - Create a service for the frontend deployment.
    - Ensure the service exposes port 80.
    - Verify the service is accessible within the cluster.

5. **Access Verification**
    - Exec into the frontend pod and test the connection to the backend service using `curl`.
    - Ensure the frontend can successfully communicate with the backend service.

