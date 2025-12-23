# ---- Hadoop AWS ----
ENV HADOOP_VERSION=3.3.6
ENV AWS_SDK_VERSION=1.12.606

curl -L https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.6/hadoop-aws-3.3.6.jar -o /home/ryano/werk/odp_lab/jars/hadoop-aws-3.3.6.jar

curl -L https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.4/hadoop-aws-3.3.4.jar -o /home/ryano/werk/odp_lab/jars/hadoop-aws-3.3.4.jar

curl -L https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.4/hadoop-aws-3.3.4.jar -o ./spark/jars/hadoop-aws-3.3.4.jar

curl -L https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.606/aws-java-sdk-bundle-1.12.606.jar -o /home/ryano/werk/odp_lab/jars/aws-java-sdk-bundle-1.12.606.jar

curl -L https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.262/aws-java-sdk-bundle-1.12.262.jar -o ./spark/jars/aws-java-sdk-bundle-1.12.262.jar

# ---- Iceberg Spark Runtime ----
RUN curl -L https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime-4.0_2.13/1.10.0/iceberg-spark-runtime-4.0_2.13-1.10.0.jar \
    -o /home/ryano/werk/odp_lab/jars/iceberg-spark-runtime-4.0_2.13-1.10.0.jar    


curl -L https://archive.apache.org/dist/spark/spark-3.5.7/spark-$3.5.7-bin-hadoop3.tgz -o spark-3.5.7-bin-hadoop3.tgz

wget -q https://dlcdn.apache.org/spark/spark-3.5.3/spark-3.5.3-bin-3.tgz
curl -L https://dlcdn.apache.org/spark/spark-3.5.7/spark-3.5.7-bin-3.tgz

curl -L https://dlcdn.apache.org/spark/spark-3.5.7/spark-3.5.7-bin-hadoop3.tgz -o spark-3.5.7-bin-hadoop3.tgz