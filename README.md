# ODP Lab

## Logical topology

<!-- ![topo](./pics/odp1.drawio.png) -->

![topo2](./pics/odp2.drawio.png)

### clone repo

```
$ git clone https://github.com/oillypump/odp_lab.git
```

### update host

```
$ cd odp_lab
$ chmod +x update-host.sh
$ sudo sh update-host.sh
```

### install python + notebook extension

<!-- ![ext1](./pics/extension_1.png)
![ext2](./pics/extension_2.png) -->

### create python env

```
$ python3 -m venv .venv
$ pip install -r requirements.txt
```

### build image and start docker container

```
$ docker compose up -d
```

## load parquet to ICEBERG

### download dan load data `yellow_tripdata_2023-01.parquet` to Iceberg

open and run jupyter notebook : /notebook/load-to-iceberg.ipynb

### check loaded table on trino & minio

- trino

![trino1](./pics/trino_1.png)

- minio

![minio1](./pics/minio_1.png)

## load parquet to DELTALAKE

### download dan load data `yellow_tripdata_2023-01.parquet` to deltalake

open and run jupyter notebook : /notebook/load-to-deltalake.ipynb

### register table on trino

```
CALL delta.system.register_table(
  schema_name => 'bronze',
  table_name  => 'nyc_taxi',
  table_location => 's3a://deltalake/lakehouse/bronze/nyc_taxi'
);

```

### check loaded table on trino & minio

- trino

![trino2](./pics/trino_2.png)

- minio

![minio2](./pics/minio_2.png)

## SPARK : Load data to Iceberg

open and run spark-load-to-iceberg.ipynb dari web jupyter

- notebook
  ![notebook1](/pics/notebook1.png)

- spark master
  ![spark-master](/pics/spark-master1.png)

- spark worker
  ![spark-worker1](/pics/spark-worker1.png)

- trino
  ![trino-spark1](/pics/trino-spark1.png)

## SPARK : read data from Iceberg

open and run spark-read-from-iceberg.ipynb dari web jupyter

- notebook
  ![notebook2](/pics/notebook2.png)

- spark master
  ![spark-read1](/pics/spark-read1.png)

- spark worker
  ![spark-read2](/pics/spark-read2.png)

- spark histo
  ![spark-histo1](/pics/spark-histo1.png)

## Refference

https://www.youtube.com/watch?v=GGdVfDdeNYs

## command

docker compose build --no-cache && docker compose up -d
