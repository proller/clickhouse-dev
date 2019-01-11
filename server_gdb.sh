#!/usr/bin/env bash
set -e

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}
export ASAN_OPTIONS=${ASAN_OPTIONS:="abort_on_error=1,detect_odr_violation=0"}
LOG_DIR=${LOG_DIR=$CUR_DIR/log/}

#export BUILD_TYPE=${BUILD_TYPE:=_debug}
#. $CUR_DIR/build.sh

GDB=${GDB:=`bash -c "compgen -c gdb | grep 'gdb[[:digit:]]' | sort --version-sort --reverse | head -n1"`}
GDB=${GDB:=gdb}

LLDB=${LLDB:=`bash -c "compgen -c lldb | grep 'lldb[[:digit:]]' | sort --version-sort --reverse | head -n1"`}
LLDB=${LLDB:=lldb}

# $LLDB -ex run \
$GDB -ex run -ex 'set pagination off' -ex "set logging file log$BUILD_TYPE.gdb0.log" -ex 'set logging on' -ex 'continue' -ex 'backtrace' -ex 'thread apply all backtrace' -ex 'backtrace' --args \
$CUR_DIR/../build${BUILD_TYPE}/dbms/programs/clickhouse-server --config=$CUR_DIR/config.xml --log=${LOG_DIR}log$BUILD_TYPE.server_gdb.log $* | tee ${LOG_DIR}log$BUILD_TYPE.gdb.log

# -ex 'set pagination off' -ex "set logging file gdb.log" -ex 'set logging on' -ex 'continue' -ex 'thread apply all backtrace' -ex 'detach' -ex 'quit'
# gdb -batch -ex run -ex 'set pagination off' -ex "set logging file gdb.log" -ex 'set logging on' -ex 'continue' -ex 'thread apply all backtrace' -ex 'detach' -ex 'quit' --args clickhouse-server --config=config.xml
# trace to file from core:
# gdb -batch -ex 'set pagination off' -ex "set logging file gdb.log" -ex 'set logging on' -ex 'backtrace' -ex 'thread apply all backtrace' -ex 'quit' clickhouse    .core
# sudo gdb -batch -ex 't apply all bt' -p $(pidof clickhouse-server) 2>&1 | tee trace

# set pagination off
# set logging file gdb.log
# set logging on
# backtrace
# thread apply all backtrace


# gdb -ex 'break __asan::ReportGenericError' -ex run 
