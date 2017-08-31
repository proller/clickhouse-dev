#!/bin/bash -e

pwd=`pwd`
cd ..
./cmake.sh
make -C ../build dict_lib dict_lib_c dict_lib_empty && \
sh -x ./with_server.sh "cat $pwd/lib_cache.sql $pwd/later.sql | grep -v '^--' | clickhouse --client --config=clickhouse-client.xml -m -n"

#sh -x ./with_server.sh "cat $pwd/hier.sql | grep -v '^--' | clickhouse --client --config=clickhouse-client.xml -m -n"
#sh -x ./with_server.sh "cat $pwd/later.sql | grep -v '^--' | clickhouse --client --config=clickhouse-client.xml -m -n"

