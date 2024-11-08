Docker Practical Run
To set up the Docker environment, first, a custom network named "symbols-net" is created to facilitate communication between containers. Next, a directory for the Nginx configuration is established, and a configuration file is created within it. This file specifies that the server listens on port 80 and forwards requests to a backend service running on port 8080.

Following the configuration setup, two Docker containers are launched. The first container, named "backend," is connected to the "symbols-net" network. It is allocated 0.5 CPU and 512MB of memory, and it exposes port 8080 to the host, running the latest version of Nginx.

The second container, named "frontend," is also connected to the "symbols-net" network. It exposes port 80 to the host and mounts the previously created Nginx configuration file into the container in a read-only mode. This container also runs the latest version of Nginx.