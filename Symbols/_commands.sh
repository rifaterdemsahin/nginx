kubectl apply -f backend-deployment.yaml
kubectl apply -f backend-service.yaml

kubectl apply -f frontend-deployment.yaml
kubectl apply -f nginx-config.yaml

kubectl get pods -l app=frontend

@rifaterdemsahin ➜ /workspaces/PolicyManagement/Symbols/Nginx (main) $ kubectl apply -f backend-deployment.yaml
deployment.apps/backend-deployment created
@rifaterdemsahin ➜ /workspaces/PolicyManagement/Symbols/Nginx (main) $ kubectl apply -f backend-service.yaml
service/backend-service created
@rifaterdemsahin ➜ /workspaces/PolicyManagement/Symbols/Nginx (main) $ kubectl apply -f frontend-deployment.yaml
deployment.apps/frontend-deployment created
@rifaterdemsahin ➜ /workspaces/PolicyManagement/Symbols/Nginx (main) $ kubectl apply -f nginx-config.yaml
configmap/nginx-config created
@rifaterdemsahin ➜ /workspaces/PolicyManagement/Symbols/Nginx (main) $ kubectl get pods -l app=frontend
NAME                                  READY   STATUS              RESTARTS   AGE
frontend-deployment-b4f657fc4-r5sm8   0/1     ContainerCreating   0          15s

kubectl exec -it frontend-deployment-b4f657fc4-r5sm8 -- curl http://backend-service:8080
First image pullback 
===============================================================================================

deployment.apps/backend-deployment created
@rifaterdemsahin ➜ /workspaces/PolicyManagement/Symbols/Nginx (main) $ kubectl apply -f backend-service.yaml
service/backend-service created
@rifaterdemsahin ➜ /workspaces/PolicyManagement/Symbols/Nginx (main) $ kubectl apply -f frontend-deployment.yaml
deployment.apps/frontend-deployment created
@rifaterdemsahin ➜ /workspaces/PolicyManagement/Symbols/Nginx (main) $ kubectl apply -f nginx-config.yaml
configmap/nginx-config created
@rifaterdemsahin ➜ /workspaces/PolicyManagement/Symbols/Nginx (main) $ kubectl get pods -l app=frontend
NAME                                   READY   STATUS    RESTARTS   AGE
frontend-deployment-58868f5d95-8grbb   1/1     Running   0          13s
@rifaterdemsahin ➜ /workspaces/PolicyManagement/Symbols/Nginx (main) $ 

Exec into the Frontend Pod and Test the Connection:

kubectl exec -it frontend-deployment-58868f5d95-8grbb  -- curl http://backend-service:8080

===============================================================================================

Pod deletion
kubectl delete pod -l app=backend
kubectl delete pod -l app=frontend


====================================================

@rifaterdemsahin ➜ /workspaces/PolicyManagement/Symbols/Nginx (main) $ kubectl get pods -l app=frontend
NAME                                   READY   STATUS    RESTARTS   AGE
frontend-deployment-58868f5d95-ghjxf   1/1     Running   0          48s

kubectl exec -it frontend-deployment-58868f5d95-ghjxf -- curl http://backend-service:8080