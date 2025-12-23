✅ FULL SCRIPT — Load Parquet → Iceberg (Spark 4 + Hive + MinIO)
1️⃣ Create Spark Session (Iceberg-ready)
from pyspark.sql import SparkSession

spark = (
    SparkSession.builder
    .appName("LoadParquetToIceberg")

    # ---- Spark cluster ----
    .master("spark://spark-master:7077")

    # ---- Iceberg catalog (Hive) ----
    .config("spark.sql.catalog.hive", "org.apache.iceberg.spark.SparkCatalog")
    .config("spark.sql.catalog.hive.type", "hive")
    .config("spark.sql.catalog.hive.uri", "thrift://hive-metastore:9083")
    .config("spark.sql.catalog.hive.warehouse", "s3a://iceberg/lakehouse")

    # ---- S3 / MinIO ----
    .config("spark.hadoop.fs.s3a.endpoint", "http://minio:9000")
    .config("spark.hadoop.fs.s3a.access.key", "minio")
    .config("spark.hadoop.fs.s3a.secret.key", "minio123")
    .config("spark.hadoop.fs.s3a.path.style.access", "true")
    .config("spark.hadoop.fs.s3a.impl", "org.apache.hadoop.fs.s3a.S3AFileSystem")

    # ---- Iceberg extension ----
    .config(
        "spark.sql.extensions",
        "org.apache.iceberg.spark.extensions.IcebergSparkSessionExtensions"
    )

    .getOrCreate()
)

print("✅ Spark version:", spark.version)
print("✅ Spark master :", spark.sparkContext.master)
print("✅ App ID       :", spark.sparkContext.applicationId)

2️⃣ Download sample data (NYC Taxi)
!curl -L https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2023-01.parquet \
    -o /tmp/yellow_tripdata_2023-01.parquet

3️⃣ Load Parquet into Spark DataFrame
df = spark.read.parquet("/tmp/yellow_tripdata_2023-01.parquet")

df.printSchema()
df.show(5)


Expected:

schema panjang (vendor_id, pickup_datetime, dll)

5 baris pertama tampil normal

4️⃣ Create Iceberg namespace (database)
spark.sql("""
    CREATE NAMESPACE IF NOT EXISTS hive.bronze
""")

5️⃣ Write DataFrame → Iceberg table
👉 Option A: create table (first time)
(
    df.writeTo("hive.bronze.nyc_taxi")
      .using("iceberg")
      .tableProperty("format-version", "2")
      .tableProperty("write.format.default", "parquet")
      .create()
)

👉 Option B: append (kalau table sudah ada)
df.writeTo("hive.bronze.nyc_taxi").append()

6️⃣ Validate Iceberg table
spark.sql("SHOW TABLES IN hive.bronze").show(truncate=False)


Expected:

+---------+----------+-----------+
|namespace|tableName |isTemporary|
+---------+----------+-----------+
|bronze   |nyc_taxi  |false      |
+---------+----------+-----------+

7️⃣ Query Iceberg table (Spark SQL)
spark.sql("""
    SELECT
        vendorid,
        COUNT(*) AS total_trips
    FROM hive.bronze.nyc_taxi
    GROUP BY vendorid
""").show()

8️⃣ Iceberg metadata check (important 🔥)
spark.sql("SELECT * FROM hive.bronze.nyc_taxi.snapshots").show(truncate=False)


Expected:

snapshot_id

committed_at

operation = append

✔️ Ini bukti Iceberg benar-benar aktif, bukan Parquet biasa.

9️⃣ Stop Spark session (clean shutdown)
spark.stop()
print("🛑 Spark session stopped")

✅ Summary: arsitektur kamu SUDAH BENAR
Jupyter Notebook
   ↓
Spark Driver
   ↓
Spark Master / Workers
   ↓
Iceberg (Hive catalog)
   ↓
MinIO (S3A)


Kalau kamu mau next step, kita bisa lanjut salah satu ini:

✔️ Trino query Iceberg table
✔️ Partitioning Iceberg (day/month)
✔️ MERGE / UPSERT Iceberg
✔️ Time travel & snapshot rollback

Tinggal bilang: lanjut ke mana 🚀




curl -L https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark3-runtime/0.13.2/iceberg-spark3-runtime-0.13.2.jar -o /home/ryano/werk/odp_lab/spark/jars/iceberg-spark3-runtime-0.13.2.jar

https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark3-runtime/0.13.2/iceberg-spark3-runtime-0.13.2.jar


curl -L http://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/3.3.6/hadoop-common-3.3.6.jar -o /home/ryano/werk/odp_lab/spark/jars/hadoop-common-3.3.6.jar


curl -L https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime-3.5_2.12/1.5.0/iceberg-spark-runtime-3.5_2.12-1.5.0.jar -o /home/ryano/werk/odp_lab/spark/iceberg-spark-runtime-3.5_2.12-1.5.0.jar