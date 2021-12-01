#!/bin/sh

# This script can be used to deploy a new container with the changes made to the documentation without
# the need to commit and push the changes to the remote repository.

# Adjust the port to your liking
port=13030

# 1. The DOCKER_HOSTS variable should be unset, this lets the Docker container run on the ansiblectl
# 2. If a container is already running, remove it
# 3. Build a new image with the tag 'betriebshandbuch-${USER}'
# 4. Create a container available at Port X with the name 'betriebshandbuch-${USER}' from the image with the same name.

echo "Unset DOCKER_HOSTS environment variable."
unset DOCKER_HOST

echo "Removing running container:"
docker rm -f betriebshandbuch-${USER}

echo "Building new image:"
docker build . -t betriebshandbuch-${USER}

echo "Deploying container:"
docker run -dit -p $port:80 --name betriebshandbuch-${USER} betriebshandbuch-${USER}

echo "View your copy of the Betriebshandbuch at:"
echo ">> http://127.0.0.1:$port <<"
