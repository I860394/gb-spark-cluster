#!/bin/bash

echo "Starting Apache Spark  Slave)..."

/opt/spark/sbin/start-slave.sh spark://9e7e7d904710:7077 

if [ $? -eq 0 ]; then
        echo "  Slave up and running."
       tail -f /opt/spark/logs/spark--org.apache.spark.deploy.*
  else
        echo "Stopping slave... as slave start up failed"
        /opt/spark/sbin/stop-slave.sh

fi

if [ $? -ne 0 ]; then
	echo "ERROR -- Unable to start up cluster!!"
	exit 1
fi

echo "Shutting down the cluster"
