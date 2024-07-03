#!/bin/bash

# Start and build containers
docker compose up --build -d

# Wait for the container to be fully up
sleep 5

# Install PHP dependencies
docker exec -it form-validation-app composer install

# Regenerate Composer autoload files
docker exec -it form-validation-app composer dump-autoload

# chmod +x setup_project.sh

# Now, you can execute your custom script by running
# ./setup_project.sh