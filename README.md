

# SQL Operator in Apache Airflow with Cloudera Data Warehousing


In Cloudera Data Engineering (CDE), the integration of Apache Airflow brings powerful workflow orchestration capabilities to the platform, allowing users to seamlessly manage and schedule data pipelines.

## Introduction

Recently, Cloudera has introduced new support for Airflow's SQL operators, enhancing the capabilities of SQL tasks within Cloudera Data Platform (CDP). This integration allows users to seamlessly with Cloudera Data Warehousing (CDW) service execute SQL commands and perform database operations using Airflow within the Cloudera ecosystem. CDE users can now leverage familiar SQL-based tasks directly within their Airflow workflows, enabling efficient database interactions and data processing.

This integration enhances the flexibility and efficiency of data workflows within Cloudera's ecosystem, empowering users to build robust and scalable data pipelines.

![](images/airflow_graph.png)

## Lab 0 - Clone the github, CDE cli install

In your home directory

```bash
git clone https://github.com/frothkoetter/CDW-CDE-Airflow-SQL-Operator.git
cd /path/to/CDW-CDE-Airflow-SQL-Operator
```

## Lab 1 - CDE CLI installation and configuration

Download software and move into the working directory

![](images/cde-cli-download.png)

```bash
chmod +x /path/to/cde
```

Navigate to CDE, Virtual Cluster copy the Jobs API URL from the CDE Virtual Cluster page

![](images/jobs_api_url.png)

i.e.

```sql
https://8v4rxpj7.cde-dvtxl9n8.se-sandb.a465-9q4k.cloudera.site/dex/api/v1
```

Edit the CDE cli config.yml file and add the Job API URL to the vcluster-endpoint
and the your login ID (user001..030)

```sql
% vi ~/.cde/config.yml

user: user001
vcluster-endpoint: https://8v4rxpj7.cde-dvtxl9n8.se-sandb.a465-9q4k.cloudera.site/dex/api/v1      
```

Save the file and return to the github


-----
## Lab 2 - Create Database

Navigate to Data Warehouse, then Virtual Warehouse and open the HUE SQL Authoring tool.

Create new database for your user to be used, or use one that is already created for you.

```sql
-- Change *** of database name
CREATE DATABASE DB_USER0**;

USE DB_USER0**;
```
Your can check your current database
```sql
select current_database();
```
-----
## Lab 3 - Check Connection configuration

Navigate to CDE on the cluster configuration and open Airflow

![](images/airflow_connection.png)
