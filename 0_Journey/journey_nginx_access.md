# Setting Up the Environment

To enable the backend and frontend to communicate with each other, we use NGINX as a reverse proxy. This setup simplifies the process and ensures seamless interaction between the services.

## Steps Taken

1. **Backend Deployment**
    - Created a backend deployment using the `nginx:latest` image.
    - Defined resource limits and requests for the backend deployment.
    - Verified that the backend deployment is running successfully.
    - Reference: [Objective and Key Results - Backend Deployment](../1_Real/okr.md#backend-deployment)

2. **Backend Service**
    - Created a service for the backend deployment.
    - Exposed port 8080 and targeted port 80 of the backend container.
    - Verified that the service is accessible within the cluster.
    - Reference: [Objective and Key Results - Backend Service](../1_Real/okr.md#backend-service)

3. **Frontend Deployment**
    - Created a frontend deployment using the `nginx:latest` image.
    - Mounted the `nginx.conf` configuration file from a ConfigMap.
    - Verified that the frontend deployment is running successfully.
    - Reference: [Objective and Key Results - Frontend Deployment](../1_Real/okr.md#frontend-deployment)

4. **Frontend Service**
    - Created a service for the frontend deployment.
    - Exposed port 80.
    - Verified that the service is accessible within the cluster.
    - Reference: [Objective and Key Results - Frontend Service](../1_Real/okr.md#frontend-service)

5. **Access Verification**
    - Executed into the frontend pod and tested the connection to the backend service using `curl`.
    - Ensured that the frontend can successfully communicate with the backend service.
    - Reference: [Objective and Key Results - Access Verification](../1_Real/okr.md#access-verification)

By following these steps, we have successfully set up an environment where the backend and frontend can interact with each other using NGINX, making the process more efficient and manageable.