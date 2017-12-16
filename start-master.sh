#!/bin/bash


echo "Starting Apache Spark Master ..."
echo "  Starting master..."
/opt/spark/sbin/start-master.sh

if [ $? -eq 0 ]; then
        echo "  Cluster up and running."
        echo "  Tailing master's logs"
        tail -f /opt/spark/logs/spark--org.apache.spark.deploy.master*
else
        echo "Stopping master... as  start up failed"
        /opt/spark/sbin/stop-master.sh
fi

if [ $? -ne 0 ]; then
	echo "ERROR -- Unable to start up Master cluster!!"
	exit 1
fi

echo "Shutting down the cluster"
