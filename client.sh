#!/usr/bin/env bash

export BUILD_TYPE=${BUILD_TYPE:="_debug"}

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

export MAKE_TARGET=clickhouse-client
bash $CUR_DIR/make.sh

#GDB=${GDB:=`bash -c "compgen -c gdb | grep 'gdb[[:digit:]]' | sort --version-sort --reverse | head -n1"`}
#GDB=${GDB:=gdb}
#LLDB=${LLDB:=`bash -c "compgen -c lldb | grep 'lldb[[:digit:]]' | sort --version-sort --reverse | head -n1"`}
#LLDB=${LLDB:=lldb}
#$LLDB -ex run $CURDIR/../build${BUILD_TYPE}/dbms/programs/clickhouse-server --config=config.xml

# valgrind  --show-leak-kinds=all --leak-check=full

# $GDB -ex 'set pagination off' -ex "set logging file gdb.log" -ex 'set logging on' -ex 'run' -ex 'thread apply all backtrace' -ex 'detach' -ex 'quit' --args \
# $GDB -ex run --args \
${CUR_DIR}/../build${BUILD_TYPE}/dbms/programs/clickhouse-client --config ${CUR_DIR}/clickhouse-client.xml --stacktrace $*

# cat ../dbms/tests/queries/0_stateless/00700_extract.sql | ./client.sh -n --ignore-error
