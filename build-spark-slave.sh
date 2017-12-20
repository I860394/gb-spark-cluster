cp Dockerfile-slave Dockerfile
docker build -t 'spark-slave-alpine:3.6' .
docker run --rm --name spark-slave  -i -t spark-slave-alpine:3.6
