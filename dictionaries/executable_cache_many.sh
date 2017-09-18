#!/usr/bin/env bash

set -e

pwd=`pwd`
cd ..
#./cmake.sh
sh -x ./with_server.sh "perl $pwd/executable_cache_many_shoot.pl | clickhouse --client --config=clickhouse-client.xml -m -n"

#sh -x ./with_server.sh "cat $pwd/hier.sql | grep -v '^--' | clickhouse --client --config=clickhouse-client.xml -m -n"
#sh -x ./with_server.sh "cat $pwd/later.sql | grep -v '^--' | clickhouse --client --config=clickhouse-client.xml -m -n"

