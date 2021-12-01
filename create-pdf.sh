#!/bin/sh

# This script can be used to create a copy of the documentation in PDF format
# After running the script the PDF document is available through the Webserver

# The script expects a running Sphinx container called 'betriebshandbuch', which is created 
# by the docker-compose file

echo "Unset DOCKER_HOSTS environment variable."
unset DOCKER_HOST

echo "Create PDF:"
docker exec -it betriebshandbuch sphinx-build -b rinoh /tmp/docs/source /var/www/html/pdf

echo "The PDF document is available at:"
echo ">> http://127.0.0.1:13030/pdf/Matrix-Betriebshandbuch.pdf <<"
