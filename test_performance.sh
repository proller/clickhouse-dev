#!/bin/sh

# --config `pwd`/clickhouse-client.xml
../build/dbms/src/Server/clickhouse --performance-test --port 19000 --r ../dbms/tests/performance > performance.json
