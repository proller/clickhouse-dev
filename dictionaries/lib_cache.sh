#!/bin/sh

pwd=`pwd`
cd ..
sh -x ./with_server.sh "cat $pwd/lib_cache.sql | clickhouse --client -m -n"