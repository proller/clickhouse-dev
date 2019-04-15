#!/usr/bin/env bash

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
PROC=${PROC:=$(( `nproc || sysctl -n hw.ncpu || echo 2` * 2))}
for i in `seq 1 ${PROC}`; do
    . ${CUR_DIR}/test.sh --testname $* --tmp=${CUR_DIR}/tmp/tmp${i} --database=test${i} --parallel=${i}/${PROC} &
done

for job in `jobs -p`; do
    echo wait $job
    wait $job || let "FAIL+=1"
done

echo $FAIL
if [ "$FAIL" == "0" ]; then
    echo "YAY!"
else
    echo "FAIL! ($FAIL)"
fi
