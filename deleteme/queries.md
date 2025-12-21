# Query Dump


## 1
CREATE SCHEMA IF NOT EXISTS delta.bronze WITH (location = 's3a://lakehouse/bronze/');

CALL delta.system.register_table( 
 	schema_name => 'bronze', 
 	table_name => 'superstore', 
 	table_location => 's3a://lakehouse/bronze/superstore'
 );

select * from delta.bronze.superstore;




SHOW SCHEMAS FROM iceberg;
SHOW TABLES FROM iceberg.bronze;

SELECT count(*) FROM iceberg.bronze.superstore;

## 2

CREATE SCHEMA IF NOT EXISTS delta.bronze WITH (location = 's3a://lakehouse/bronze/');

CALL delta.system.register_table( 
 	schema_name => 'bronze', 
 	table_name => 'superstore', 
 	table_location => 's3a://lakehouse/bronze/superstore'
 );

select * from delta.bronze.superstore;


SHOW CATALOGS;
SHOW SC

CREATE SCHEMA delta.silver
WITH (
  location = 's3://deltalake/silver'
);

SELECT *
FROM delta.bronze.nyc_taxi
LIMIT 10;


SHOW SCHEMAS FROM iceberg;
SHOW TABLES FROM iceberg.bronze;

SELECT count(*) FROM iceberg.bronze.superstore;

CALL delta.system.register_table(
  schema_name => 'bronze',
  table_name  => 'nyc_taxi',
  table_location => 's3a://deltalake/lakehouse/bronze/nyc_taxi'
);


CALL delta.system.register_table( 
 	schema_name => 'bronze', 
 	table_name => 'superstore', 
 	table_location => 's3a://lakehouse/bronze/superstore'
 );


select *from delta.bronze.nyc_taxi;


## 3

select * from iceberg.bronze.taxi_dataset 

## 4 

select * from iceberg.bronze.taxi_dataset;

select * from delta.bronze.taxi_dataset;

## 5

select *from iceberg.bronze.taxi_dataset ;

