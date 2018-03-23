#!/usr/bin/env bash
set -e

# USAGE:
# BUILD_TYPE=_debug ./with_server.sh ./test_performance.sh

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
#cd ..
killall clickhouse clickhouse-server || true

#BUILD_TYPE=_asan

("${CURDIR}/build.sh")

#(sleep 16 && clickhouse-client -m -n < ../dbms/tests/queries/0_stateless/00314_sample_factor_virtual_column.sql) &
#(sleep 16 && $*) &

trap 'kill -TERM $pid; wait $pid' TERM


$CURDIR/server.sh &

#(sleep 25 && eval $*)

#$CURDIR/server_gdb.sh
#$CURDIR/server_valgrind.sh

#gdb -ex run --args \
#valgrind \
#../build$BUILD_TYPE/dbms/src/Server/clickhouse-server --config-file=./config.xml &

pid=$!
#sleep 20
cd $CURDIR

(sleep 3 && eval $*)


sleep 1
kill $pid
