#!/bin/sh -e

# USAGE:
# ./with_server.sh ./test_performance.sh

pwd=`pwd`
#cd ..
killall clickhouse || true
("./build.sh")

#(sleep 16 && clickhouse --client -m -n < ../dbms/tests/queries/0_stateless/00314_sample_factor_virtual_column.sql) &
#(sleep 16 && $*) &

trap 'kill -TERM $pid; wait $pid' TERM

#gdb -ex run --args 
../build/dbms/src/Server/clickhouse --server --config-file=./config.xml &
#server.sh &
pid=$!
#sleep 4
cd $pwd

(sleep 3 && eval $*)


sleep 1
kill $pid
