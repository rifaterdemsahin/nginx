@rifaterdemsahin ➜ /workspaces/nginx (main) $ docker exec frontend1 curl -s http://backend:8080
Empty>>>

From the setup you provided, the likely reason you’re not seeing the expected response from the backend through NGINX could be due to a configuration or networking issue. Here are some steps to troubleshoot and verify:

1. **Check Backend Port Mapping**:
   - You set the `backend` container to expose port 8080 on the host, but inside the container, NGINX’s default configuration serves content on port 80. Update your backend container's port to use `-p 8080:8080` or modify the NGINX configuration to listen on port 80.

2. **Verify Backend Response**:
   - Use `curl` directly on the backend container to ensure it's running correctly.
     ```bash
     docker exec backend curl -s http://localhost:80
     ```
   - This command should return the default NGINX page or any response configured in the backend.

   @rifaterdemsahin ➜ /workspaces/nginx (main) $ docker exec backend curl -s http://localhost:80
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>

3. **Update `proxy_pass` URL**:
   - Ensure that the `proxy_pass` directive in your `nginx.conf` on the frontend container points to the correct backend container port. If you changed the backend to `-p 8080:8080`, update the configuration:
     ```nginx
     proxy_pass http://backend:80;
     ```
   - If you kept the backend configuration as `-p 8080:8080`, use `proxy_pass http://backend:8080;`.

4. **Verify Network Connectivity**:
   - Ensure that both containers are on the same network (`symbols-net`). You can test network connectivity by executing a simple ping command:
     ```bash
     docker exec frontend1 ping -c 2 backend
     ```

     @rifaterdemsahin ➜ /workspaces/nginx (main) $ docker exec frontend1 ping -c 2 backend
OCI runtime exec failed: exec failed: unable to start container process: exec: "ping": executable file not found in $PATH: unknown
@rifaterdemsahin ➜ /workspaces/nginx (main) $ 

5. **Reload Frontend NGINX**:
   - If you updated the `nginx.conf`, reload the NGINX configuration in the frontend container:
     ```bash
     docker exec frontend1 nginx -s reload
     ```
@rifaterdemsahin ➜ /workspaces/nginx (main) $  docker exec frontend1 nginx -s reload
2024/11/08 13:54:10 [notice] 60#60: signal process started
@rifaterdemsahin ➜ /workspaces/nginx (main) $ 


After making these adjustments, try running the `curl` command again from `frontend1`:
```bash
docker exec frontend1 curl -s http://backend:8080
```

This should give you the expected NGINX response if everything is set up correctly.