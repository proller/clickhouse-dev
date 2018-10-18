#!/usr/bin/env bash

set -e
set -x

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export CH_DIR=${CH_DIR:="$CUR_DIR/.."}

make -C $CH_DIR/docker/builder

cd $CH_DIR/docker/server && docker build --network=host -t clickhouse-server . && docker run --network=host clickhouse-server
cd $CH_DIR/docker/client && docker build --network=host -t clickhouse-client . && docker run --network=host clickhouse-client
cd $CH_DIR/docker/test && docker build --network=host -t clickhouse-test .     && docker run --network=host clickhouse-test
