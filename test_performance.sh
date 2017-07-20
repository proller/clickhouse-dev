#!/bin/sh

../build/dbms/src/Server/clickhouse --performance-test --r ../dbms/tests/performance > performance.json
