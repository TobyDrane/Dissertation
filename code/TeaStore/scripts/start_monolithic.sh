#!/bin/bash

# Creates and runs the monolithic architecture
# First build the database from image - NOTE this image is from the Docker Registry
# We could use our local but this is fine for now
docker run -p 3306:3306 -d --name teastore-db descartesresearch/teastore-db
echo "TeaStore db running..."

# Now build the teastore all image
docker build -t teastore-all ./utilities/tools.descartes.teastore.docker.all/
echo "TeaStore monolithic built..."

# Now run it
docker run -e "DB_HOST=teastore-db" -p 8080:8080 -d --link teastore-db:teastore-db --name teastore-all teastore-all
echo "TeaStore running on localhost..."
echo "http://localhost:8080/tools.descartes.teastore.webui/"