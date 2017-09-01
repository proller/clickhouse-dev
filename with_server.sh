#!/bin/sh -e

# USAGE:
# BUILD_TYPE=_debug ./with_server.sh ./test_performance.sh

#pwd=`pwd`
pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
#cd ..
killall clickhouse || true

#BUILD_TYPE=_asan

("./build.sh")

#(sleep 16 && clickhouse --client -m -n < ../dbms/tests/queries/0_stateless/00314_sample_factor_virtual_column.sql) &
#(sleep 16 && $*) &

trap 'kill -TERM $pid; wait $pid' TERM

#gdb -ex run --args \
#valgrind \
../build$BUILD_TYPE/dbms/src/Server/clickhouse --server --config-file=./config.xml &
#server.sh &
pid=$!
#sleep 20
cd $pwd

(sleep 3 && eval $*)


sleep 1
kill $pid
