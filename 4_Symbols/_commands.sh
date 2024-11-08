minikube start
kubectl apply -f backend-deployment.yaml
kubectl apply -f backend-service.yaml

kubectl apply -f frontend-deployment.yaml
kubectl apply -f nginx-config.yaml

kubectl get pods -l app=frontend

@rifaterdemsahin ➜ /workspaces/PolicyManagement/Symbols/Nginx (main) $ kubectl get pods -l app=frontend
NAME                                  READY   STATUS              RESTARTS   AGE
frontend-deployment-b4f657fc4-r5sm8   0/1     ContainerCreating   0          15s

kubectl exec -it frontend-deployment-b4f657fc4-r5sm8 -- curl http://backend-service:8080

===============================================================================================

Pod deletion
kubectl delete pod -l app=backend
kubectl delete pod -l app=frontend


====================================================
