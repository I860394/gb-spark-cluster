cp Dockerfile-master Dockerfile
docker network create  gbcluster
docker build -t 'spark-master-alpine:3.6' .
docker run --rm --name spark-master --network=gbcluster -p7077:7077 -p8080:8080 -i -t spark-master-alpine:3.6
