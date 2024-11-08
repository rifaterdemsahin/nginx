🚀 **Docker Practical Run**

1. **Create a Custom Network**: Begin by creating a custom network named "symbols-net" 🌐. This network is essential for enabling communication between the containers that will be set up in subsequent steps.

2. **Set Up Nginx Configuration**: 
   - **Create Configuration Directory**: Establish a directory for storing the Nginx configuration files 📂.
   - **Create Configuration File**: Within this directory, create a configuration file that specifies the server settings. The server is configured to listen on port 80 🔊 and forward incoming requests to a backend service running on port 8080 🔄.

3. **Launch Docker Containers**:
   - **Backend Container**:
     - **Connect to Network**: Launch the "backend" container 🛠️ and connect it to the "symbols-net" network.
     - **Resource Allocation**: Allocate 0.5 CPU 🧠 and 512MB of memory 💾 to this container.
     - **Port Exposure**: Expose port 8080 to the host, allowing external access to the backend service.
     - **Run Nginx**: The container runs the latest version of Nginx.

   - **Frontend Container**:
     - **Connect to Network**: Launch the "frontend" container 🎨 and connect it to the "symbols-net" network.
     - **Port Exposure**: Expose port 80 to the host, making the frontend service accessible externally.
     - **Mount Configuration**: Mount the previously created Nginx configuration file into the container in a read-only mode 🔒.
     - **Run Nginx**: This container also runs the latest version of Nginx.

By following these steps, the Docker environment is set up with interconnected containers, each serving a specific role in the application architecture.