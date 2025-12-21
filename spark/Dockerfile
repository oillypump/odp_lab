FROM spark:4.0.1-scala2.13-java21-ubuntu

USER root

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# ---- Hadoop + AWS JAR ----
# ENV HADOOP_VERSION=3.3.6 \
#     AWS_SDK_VERSION=1.12.262

# RUN curl -L https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/${HADOOP_VERSION}/hadoop-aws-${HADOOP_VERSION}.jar \
#     -o /opt/spark/jars/hadoop-aws-${HADOOP_VERSION}.jar && \
#     curl -L https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/${AWS_SDK_VERSION}/aws-java-sdk-bundle-${AWS_SDK_VERSION}.jar \
#     -o /opt/spark/jars/aws-java-sdk-bundle-${AWS_SDK_VERSION}.jar

USER spark