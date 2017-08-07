#!/bin/sh

pwd=`pwd`
cd ..
make -C ../build dict_lib dict_lib_c empty && \
sh -x ./with_server.sh "cat $pwd/lib_cache.sql | grep -v '^--' | clickhouse --client --config=clickhouse-client.xml -m -n"
