#!/usr/bin/env bash

#pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
pwd=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

for i in {1..90000}; do
 echo $i
 sleep 0.02
 killall -9 clickhouse-client
done
