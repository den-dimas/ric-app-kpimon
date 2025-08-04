# Remove existing container and image
docker kill kpimon 
docker rm kpimon 
docker rmi kpimon

# Build the image
docker build  --build-arg DBAAS_SERVICE_HOST=10.0.2.12 --build-arg DBAAS_SERVICE_PORT=6379 -f Dockerfile -t kpimon:latest . --no-cache

# Run and exec into the container
docker run -d -it --entrypoint /bin/bash --network ric --ip 10.0.2.25 -e DBAAS_SERVICE_HOST=10.0.2.12 -e DBAAS_SERVICE_PORT=6379 --name kpimon kpimon:latest
docker exec -it kpimon /bin/bash