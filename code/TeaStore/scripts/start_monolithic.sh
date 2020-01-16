#!/bin/bash

# Creates and runs the monolithic architecture
# First build the database from image - NOTE this image is from the Docker Registry
# We could use our local but this is fine for now
docker run -p 3306:3306 -d --name teastore-db descartesresearch/teastore-db
echo "TeaStore db running..."

# Lets now create and run the RabbitMQ image - this is needed for Kieker logging
# Again we could use our local image but this is fine
docker run -d --expose 5672 -p 15672:15672 -p 5672:5672 -p 8081:8080 --name rabbitmq descartesresearch/teastore-kieker-rabbitmq

# Now build the teastore all image
docker build -t teastore-all ./utilities/tools.descartes.teastore.docker.all/
echo "TeaStore monolithic built..."

# Now run it
docker run -e "DB_HOST=teastore-db" -e "RABBITMQ_HOST=rabbitmq" -p 8080:8080 -d --link rabbitmq:rabbitmq --link teastore-db:teastore-db --name teastore-all teastore-all
echo "TeaStore running on localhost..."
echo "http://localhost:8080/tools.descartes.teastore.webui/"