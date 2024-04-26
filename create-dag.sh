#!/bin/sh

USER=user001

echo "AIRFLOW CDE SQL OPERATOR HOL INITIATED...."
echo "."
echo "Provided CDE User: "$USER

USER=user001

# Variables for Airflow
RESOURCE=demo-dag-$USER
JOB=demo-job-$USER

echo "create resource:"$RESOURCE
./cde resource create --name $RESOURCE

echo "upload file"
./cde resource upload --name $RESOURCE --local-path demo-dag.py

echo "describe"
./cde resource describe --name $RESOURCE


# Create Job of “airflow” type and reference the DAG
echo "delete job:"$JOB
./cde job delete --name $JOB 
echo "create job:"$JOB
./cde job create --name $JOB --type airflow --dag-file demo-dag.py  --mount-1-resource $RESOURCE

#Trigger Airflow job to run
echo "start job:"$JOB

./cde job run --name $JOB | grep "id" | awk -F":" '{print $2}' | xargs ./cde run describe --id 
