To run this project on Minikube using GitHub Codespaces, follow these steps:

1. **Start Minikube**: Ensure Minikube is installed and start it with the following command:
   ```sh
   minikube start
   ```

2. **Set Docker Environment**: Configure your shell to use Minikube's Docker daemon:
   ```sh
   eval $(minikube -p minikube docker-env)
   ```

3. **Apply Kubernetes Configurations**: Use the provided `k8s_setup.sh` script to create and apply the necessary Kubernetes resources:
   ```sh
   ./4_Symbols/inline_implement/k8s_setup.sh
   ```

4. **Verify Deployments**: Check the status of your deployments to ensure they are running correctly:
   ```sh
   kubectl get pods
   kubectl get services
   ```

5. **Access Services**: Use Minikube to access the services. For example, to access the frontend service:
   ```sh
   minikube service frontend-deployment
   ```

6. **Cleanup**: When done, clean up the resources using the `k8s_cleanup.sh` script:
   ```sh
   ./4_Symbols/inline_implement/k8s_cleanup.sh
   ```

By following these steps, you can run the project on Minikube within GitHub Codespaces effectively.