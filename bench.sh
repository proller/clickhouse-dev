#!/usr/bin/env bash

sudo apt install -y wget

BENCH_DIR=${BENCH_DIR=bench}

mkdir -p ${BENCH_DIR}
cd ${BENCH_DIR}

[ ! -s clickhouse ] && wget -O clickhouse https://clickhouse-builds.s3.yandex.net/0/a691747129fc7b5d8a1629f324ca08952ca3d80d/1580617747_binary/clickhouse
chmod a+x clickhouse

[ ! -s config.xml ] && wget -O config.xml https://raw.githubusercontent.com/ClickHouse/ClickHouse/master/dbms/programs/server/config.xml
[ ! -s users.xml ]wget -O users.xml https://raw.githubusercontent.com/ClickHouse/ClickHouse/master/dbms/programs/server/users.xml
mkdir -p config.d
[ ! -s config.d/path.xml ] && wget -O config.d/path.xml https://raw.githubusercontent.com/ClickHouse/ClickHouse/master/dbms/programs/server/config.d/path.xml
[ ! -s config.d/log_to_console.xml ] && wget -O config.d/log_to_console.xml https://raw.githubusercontent.com/ClickHouse/ClickHouse/master/dbms/programs/server/config.d/log_to_console.xml

[ ! -s benchmark-new.sh ] && wget -O benchmark-new.sh https://raw.githubusercontent.com/ClickHouse/ClickHouse/master/dbms/benchmark/clickhouse/benchmark-new.sh
chmod a+x benchmark-new.sh
[ ! -s queries.sql ] && wget -O queries.sql https://raw.githubusercontent.com/ClickHouse/ClickHouse/master/dbms/benchmark/clickhouse/queries.sql

[ ! -s hits_100m_obfuscated_v1.tar.xz ] && wget -O hits_100m_obfuscated_v1.tar.xz https://clickhouse-datasets.s3.yandex.net/hits/partitions/hits_100m_obfuscated_v1.tar.xz
tar xvf hits_100m_obfuscated_v1.tar.xz -C .
mv hits_100m_obfuscated_v1/* .
