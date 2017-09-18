#!/usr/bin/env bash

../build${BUILD_TYPE}/dbms/src/Server/clickhouse --client --config `pwd`/clickhouse-client.xml $*
