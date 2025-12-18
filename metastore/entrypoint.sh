#!/bin/bash
set -e

# Tunggu DB siap
# /wait-for-it.sh metastore-db:5432 --timeout=60 --strict


if /opt/hive/bin/schematool -dbType postgres -info 2>/dev/null | grep -q "Metastore schema version: 4.0.0"; then
  echo "Schema already initialized"
else
  echo "Initializing Hive schema..."
  /opt/hive/bin/schematool -dbType postgres -initSchema
fi

exec /opt/hive/bin/hive --service metastore