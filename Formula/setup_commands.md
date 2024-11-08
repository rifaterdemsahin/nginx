# Steps to Achieve the Objective

1. **Create Backend Deployment**
    ```sh
    kubectl apply -f backend-deployment.yaml
    ```

2. **Create Backend Service**
    ```sh
    kubectl apply -f backend-service.yaml
    ```

3. **Create Frontend Deployment**
    ```sh
    kubectl apply -f frontend-deployment.yaml
    ```

4. **Create Frontend Service**
    ```sh
    kubectl apply -f nginx-config.yaml
    ```

5. **Verify Access**
    ```sh
    kubectl get pods -l app=frontend
    kubectl exec -it <frontend-pod-name> -- curl http://backend-service:8080
    ```

6. **Clean Up**
    ```sh
    kubectl delete pod -l app=backend
    kubectl delete pod -l app=frontend
    ```