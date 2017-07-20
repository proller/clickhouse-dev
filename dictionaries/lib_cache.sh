#!/bin/sh

pwd=`pwd`
cd ..
make -C ../build dict_lib
sh -x ./with_server.sh "cat $pwd/lib_cache.sql | grep -v "^--" | clickhouse --client -m -n"
