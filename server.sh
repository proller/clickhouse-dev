#!/bin/sh -e

./build.sh && ../build$BUILD_TYPE/dbms/src/Server/clickhouse --config=config.xml
