cp Dockerfile-slave Dockerfile
docker build -t 'spark-slave-alpine:3.6' .
docker rm -f spark-slave
docker run --rm --name spark-slave -p8081:8081 -i -t spark-slave-alpine:3.6
