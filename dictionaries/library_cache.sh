#!/usr/bin/env bash

set -e
set -x

DCURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

#cd ..
. $DCURDIR/../cmake.sh
. $DCURDIR/../make.sh dictionary_library dictionary_library_c dictionary_library_empty
. $DCURDIR/../with_server.sh "cat $DCURDIR/library_cache.sql $CURDIR/later.sql | grep -v '^--' | clickhouse-client --config=clickhouse-client.xml -m -n"

#sh -x ./with_server.sh "cat $DCURDIR/hier.sql | grep -v '^--' | clickhouse-client --config=clickhouse-client.xml -m -n"
#sh -x ./with_server.sh "cat $DCURDIR/later.sql | grep -v '^--' | clickhouse-client --config=clickhouse-client.xml -m -n"

