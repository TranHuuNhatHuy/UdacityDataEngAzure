# Project: Data Modeling with Apache Cassandra

(scroll down for solution at [section II](https://github.com/TranHuuNhatHuy/UdacityDataEngAzure/blob/main/I.DataModeling/README.md#ii-solutions))

## I. Project Overview

### 1. Background

A startup called Sparkify wants to analyze the data they've been collecting on songs and user activity on their new music streaming app. The analysis team is particularly interested in understanding what songs users are listening to. Currently, there is no easy way to query the data to generate the results, since the data reside in a directory of CSV files on user activity on the app.

They'd like a data engineer to create an Apache Cassandra database which can create queries on song play data to answer the questions, and wish to bring you on the project. Your role is to create a database for this analysis. You'll be able to test your database by running queries given to you by the analytics team from Sparkify to create the results.

In this project, you'll apply what you've learned on data modeling with Apache Cassandra and complete an ETL pipeline using Python. To complete the project, you will need to model your data by creating tables in Apache Cassandra to run queries. You are provided with part of the ETL pipeline that transfers data from a set of CSV files within a directory to create a streamlined CSV file to model and insert data into Apache Cassandra tables.

We have provided you with a project template that takes care of all the imports and provides a structure for ETL pipeline you'd need to process this data.

### 2. Datasets

For this project, you'll be working with one dataset: event_data. The directory of CSV files partitioned by date. Here are examples of filepaths to two files in the dataset:

```
event_data/2018-11-08-events.csv
event_data/2018-11-09-events.csv
...
```

### 3. Project template

The project template includes one Jupyter Notebook file, in which:

- You will process the `event_datafile_new.csv` dataset to create a denormalized dataset
- You will model the data tables keeping in mind the queries you need to run
- You have been provided queries that you will need to model your data tables for
- You will load the data into tables you create in Apache Cassandra and run your queries

### 4. Project steps

#### a. Modeling your NoSQL database or Apache Cassandra database

1. Design tables to answer the queries outlined in the project template
2. Write Apache Cassandra `CREATE KEYSPACE` and `SET KEYSPACE` statements
3. Develop your `CREATE` statement for each of the tables to address each question
4. Load the data with `INSERT` statement for each of the tables
5. Include `IF NOT EXISTS` clauses in your `CREATE` statements to create tables only if the tables do not already exist. We recommend you also include `DROP TABLE` statement for each table, this way you can run drop and create tables whenever you want to reset your database and test your ETL pipeline
6. Test by running the proper select statements with the correct `WHERE` clause

#### b. Build ETL Pipeline

1. Implement the logic in section Part I of the notebook template to iterate through each event file in event_data to process and create a new CSV file in Python
2. Make necessary edits to Part II of the notebook template to include Apache Cassandra `CREATE` and `INSERT` statements to load processed records into relevant tables in your data model
3. Test by running `SELECT` statements after running the queries on your database


## II. Solutions

### 1. Modeling NoSQL database or Apache Cassandra database

Everything is quite clear in the Project Template notebook already, both the given template and my code, so allow me to cut this part off.

### 2. Build ETL Pipeline

The ETL pipeline to achieve the project targets includes:

1. Copy the data from `event_data/2018-*.csv` files and merge all to a single denormalized dataset `event_datafile_new.csv`, whose structure is shown in the image below.

<img src="./assets/image_event_datafile_new.jpg">

2. From this CSV file, 3 tables will be created and populated with data from it, to specifically and optimally serve 3 queries of:
    a. `artist`, `song title` and `song's length` in the music app history that was heard during `sessionId = 338`, and `itemInSession = 4`.
    b. `artist`, `song` (sorted by `itemInSession`) and user (`firstName` and `lastName`) for `userid = 10`, `sessionid = 182`.
    c. User name (`firstName` and `lastName`) in my music app history who listened to the song "All Hands Against His Own".

3. For each table and query above, based on the notebook template, I:
    1. Create a table specific for that query with `CREATE` query.
    2. Populate that table with proper schema with `INSERT` query.
    3. Test by running `SELECT` statements to see if the data is properly loaded and used after running those 2 queries on the table.
  
### 3. Criteria

1. Student creates the correct Apache Cassandra tables for each of the three queries. The `CREATE TABLE` statement should include the appropriate table.
2. Student demonstrates good understanding of data modeling by generating correct `SELECT` statements to generate the result being asked for in the question. The `SELECT` statement should `NOT` use `ALLOW FILTERING` to generate the results.
3. Student should use table names that reflect the query and the result it will generate. Table names should include alphanumeric characters and underscores, and table names must start with a letter.
4. The sequence in which columns appear should reflect how the data is partitioned and the order of the data within the partitions.
5. The combination of the `PARTITION KEY` alone or with the addition of `CLUSTERING COLUMNS` should be used appropriately to uniquely identify each row.
6. The notebook should include student's thoughts and solutions in comments. Code should be organized well into the different queries. Any in-line comments that were clearly part of the project instructions should be removed so the notebook provides a professional look.
