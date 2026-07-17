Here's the updated README with **Apache Cassandra** integrated naturally into the project flow.

---

# Ecommerce Hadoop Big Data

A comprehensive collection of practical notes documenting the implementation of an end-to-end **e-commerce big data pipeline** using the Hadoop ecosystem. The project demonstrates how structured, semi-structured, and streaming data can be ingested, processed, stored, and analyzed using industry-standard big data technologies.

The project also includes **Apache Cassandra** to demonstrate distributed NoSQL database concepts and operational data storage commonly used in modern data engineering systems.

The notes serve as a practical reference for building and understanding a complete batch and streaming data engineering workflow rather than individual technology tutorials.

---

# Project Overview

The implementation is based on an e-commerce platform consisting of multiple data sources:

* **E-commerce transactional data**

  * Orders
  * Order Items
* **Application logs**
* **Clickstream events**

These datasets are processed through different components of the Hadoop ecosystem to demonstrate real-world data engineering workflows.

---

# Data Pipeline

```text
                 Data Sources
        ┌────────────┬──────────────┐
        │            │              │
        ▼            ▼              ▼
  Order Data   Application Logs   Clickstream
        │            │              │
        │            │          Apache Kafka
        │        Apache Flume       │
        └────────────┬──────────────┘
                     ▼
                   HDFS
                     │
          Bronze → Silver → Gold
                     │
         ┌───────────┴───────────┐
         ▼                       ▼
      Apache Hive           Apache HBase
         │                       │
         └───────────┬───────────┘
                     ▼
             Apache Cassandra
                     │
                     ▼
             Business Analytics
```

---

# Technologies Implemented

* Hadoop Distributed File System (HDFS)
* YARN
* Apache Pig
* Apache Hive
* Apache HBase
* Apache Cassandra
* Apache Flume
* Apache Kafka
* Docker

---

# Implemented Modules

## HDFS

* Hadoop cluster setup
* Data ingestion
* File management
* Distributed storage
* Bronze, Silver, and Gold data organization

---

## YARN

* Cluster resource management
* Node monitoring
* Application execution
* Cluster verification

---

## Apache Pig

Implementation of the complete batch ETL pipeline.

* Bronze layer ingestion
* Silver layer data cleansing
* Gold layer business transformations

Generated analytical datasets include:

* Orders Fact
* Monthly Sales
* Revenue by Category
* Payment Analysis
* Top Customers

---

## Apache Hive

Data warehouse implementation for querying processed e-commerce data.

Topics include:

* Database creation
* Table creation
* Hive Metastore
* HiveServer2
* SQL-based analytics

---

## Apache HBase

NoSQL storage implementation for serving processed analytical datasets.

Includes:

* Table design
* Schema creation
* CRUD operations
* Loading Gold layer datasets into HBase
* Query examples

---

## Apache Cassandra

Distributed wide-column NoSQL database implementation for handling operational e-commerce data.

Topics include:

* Cluster setup
* Keyspaces
* Table design
* CRUD operations
* Bulk CSV loading
* Secondary Indexes
* TTL
* Lightweight Transactions (LWT)
* Batch Operations
* Collection Data Types
* Replication Strategy
* Consistency Levels
* SSTables
* Compaction
* Gossip Protocol
* Hinted Handoff
* Repair
* Read and Write Path concepts

---

## Apache Flume

Log ingestion pipeline for application monitoring.

Implementation includes:

* Log collection
* Flume Sources
* Channels
* HDFS Sink
* Continuous application log ingestion into HDFS

---

## Apache Kafka

Streaming pipeline implementation using clickstream events.

Includes:

* Topic management
* Producers
* Consumers
* Consumer Groups
* Partitions
* Offsets
* Rebalancing
* Delivery Guarantees
* Kafka to HDFS streaming pipeline

---

# Business Use Case

The project simulates the data platform of an e-commerce company by integrating multiple data sources:

* Transactional order data
* Customer purchasing activity
* Website clickstream events
* Application logs

The data is processed through different stages of the Hadoop ecosystem to produce analytics-ready datasets that can be queried, stored, served, and further analyzed using both warehouse and NoSQL technologies.
