#!/usr/bin/env bash
set -e

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

export ASAN_OPTIONS=${ASAN_OPTIONS:="abort_on_error=1"}

#export BUILD_TYPE=${BUILD_TYPE:=_debug}
#$CURDIR/build.sh

GDB=${GDB:=`bash -c "compgen -c gdb | grep 'gdb[[:digit:]]' | sort --version-sort --reverse | head -n1"`}
GDB=${GDB:=gdb}

LLDB=${LLDB:=`bash -c "compgen -c lldb | grep 'lldb[[:digit:]]' | sort --version-sort --reverse | head -n1"`}
LLDB=${LLDB:=lldb}

#$LLDB -ex run $CURDIR/../build${BUILD_TYPE}/dbms/src/Server/clickhouse -- server --config=config.xml

$GDB -ex run --args $CURDIR/../build${BUILD_TYPE}/dbms/src/Server/clickhouse server --config=config.xml

# -ex 'set pagination off' -ex 'set logging on' -ex "set logging file gdb.log" -ex 'continue' -ex 'thread apply all backtrace' -ex 'detach' -ex 'quit'
# gdb -ex run  -batch -ex 'set pagination off' -ex 'set logging on' -ex "set logging file gdb.log" -ex 'continue' -ex 'thread apply all backtrace' -ex 'detach' -ex 'quit' --args clickhouse --server --config=config.xml
# trace to file from core:
# gdb -batch -ex 'set pagination off' -ex 'set logging on' -ex "set logging file gdb.log" -ex 'backtrace' -ex 'thread apply all backtrace' -ex 'quit' clickhouse    .core
