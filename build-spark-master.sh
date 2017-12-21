cp Dockerfile-master Dockerfile
docker network create --driver bridge gbcluster

#if  grep -Fxq "AllowTcpForwarding yes" /etc/ssh/sshd_config
#then
#   echo "AllowTcpForwarding already configured"
#else
#   echo "setting AllowTcpForwarding to yes"
#   sudo echo "AllowTcpForwarding yes" >> /etc/ssh/sshd_config
#   sudo service ssh restart
#fi
docker build -t 'spark-master-alpine:3.6' .
docker rm -f spark-master
docker run --rm --name spark-master  -v ~/sparkdata:/sparkdata --network=gbcluster -p7077:7077 -p8080:8080 -i -t spark-master-alpine:3.6
