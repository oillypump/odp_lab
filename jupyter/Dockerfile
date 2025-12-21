FROM python:3.10-slim

# ===============================
# System deps
# ===============================
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    openjdk-21-jre-headless \
    tini \
    && rm -rf /var/lib/apt/lists/*

# ===============================
# Create non-root user
# ===============================
ARG UID=1000
ARG GID=1000

RUN groupadd -g ${GID} jupyter \
    && useradd -m -u ${UID} -g ${GID} -s /bin/bash jupyter

# ===============================
# Python deps
# ===============================
RUN pip install --no-cache-dir \
    jupyterlab \
    pyspark==4.0.1 \
    ipykernel \
    pandas \
    pyarrow

# ===============================
# Jupyter runtime dirs
# ===============================
RUN mkdir -p /home/jupyter/notebooks \
    /home/jupyter/.local/share/jupyter/runtime \
    && chown -R jupyter:jupyter /home/jupyter

ENV HOME=/home/jupyter \
    JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64 \
    PYSPARK_PYTHON=python3 \
    PYSPARK_DRIVER_PYTHON=python3 \
    JUPYTER_RUNTIME_DIR=/home/jupyter/.local/share/jupyter/runtime

WORKDIR /home/jupyter/notebooks

USER jupyter

# ===============================
# Expose Jupyter
# ===============================
EXPOSE 8888

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--NotebookApp.token=", "--NotebookApp.password="]
