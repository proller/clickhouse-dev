#!/usr/bin/env bash

set -e
set -x

DCURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

NAME=${NAME:="odbc_clickhouse_localhost.sql"}

#cd ..
. $DCURDIR/../cmake.sh
. $DCURDIR/../with_server.sh "cat $DCURDIR/$NAME | grep -v '^--' | ${CURDIR}/../build$BUILD_TYPE/dbms/programs/clickhouse-client --config=clickhouse-client.xml -m -n"

