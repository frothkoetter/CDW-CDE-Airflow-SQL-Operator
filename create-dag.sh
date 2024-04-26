# Create a resource
USER=user001

# Variables for Airflow
RESOURCE=demo-dag-$USER
JOB=demo-job-$USER

./cde resource delete --name $RESOURCE
./cde resource create --name $RESOURCE
./cde resource upload --name $RESOURCE --local-path demo-dag.py
./cde resource describe --name $RESOURCE


# Create Job of “airflow” type and reference the DAG
./cde job delete --name $JOB 
./cde job create --name $JOB --type airflow --dag-file demo-dag.py  --mount-1-resource $RESOURCE

#Trigger Airflow job to run
./cde job run --name $JOB
