# ODP Lab

## clone
```
git clone https://github.com/oillypump/odp_lab.git
```

## update host
```
cd odp_lab
chmod +x update_host.sh
sudo sh update_host.sh
```

## install python + notebook extension

![ext1](./pics/extension_1.png)
![ext2](./pics/extension_2.png)

## create python env

```
python3 -m venv .venv
pip install -r requirements.txt
```

## download dan load data ``yellow_tripdata_2023-01.parquet`` to Iceberg 

open and run jupyter notebook : /notebook/load-to-iceberg.ipynb

## check loaded table on trino & minio

![trino1](./pics/trino_1.png)

![minio1](./pics/minio_1.png)