#!/bin/bash

# --config `pwd`/clickhouse-client.xml
../build$BUILD_TYPE/dbms/src/Server/clickhouse --performance-test --port 19000 --r ../dbms/tests/performance > performance.json
