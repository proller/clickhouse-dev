#!/usr/bin/env bash

set -e

pwd=`pwd`
cd ..
./cmake.sh
make -C ../build dictionary_library dictionary_library_c dictionary_library_empty
sh -x ./with_server.sh "cat $pwd/library_cache.sql $pwd/later.sql | grep -v '^--' | clickhouse --client --config=clickhouse-client.xml -m -n"

#sh -x ./with_server.sh "cat $pwd/hier.sql | grep -v '^--' | clickhouse --client --config=clickhouse-client.xml -m -n"
#sh -x ./with_server.sh "cat $pwd/later.sql | grep -v '^--' | clickhouse --client --config=clickhouse-client.xml -m -n"

