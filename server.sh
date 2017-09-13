#!/bin/bash -e

pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
# ${pwd}/build.sh
${pwd}/../build$BUILD_TYPE/dbms/src/Server/clickhouse --config=config.xml $*

