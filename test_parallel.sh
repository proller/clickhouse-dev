#!/usr/bin/env bash

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
PROC=${PROC:=$(( `nproc || sysctl -n hw.ncpu || echo 2` * 2))}
for i in `seq 1 ${PROC}`; do
    . ${CURDIR}/test.sh --order=random --testname &
done

# for i in {1..5000}; do
#    sleep 0.1
#    . ${pwd}/client.sh --query="KILL QUERY WHERE 1"
# done

for job in `jobs -p`; do
    echo $job
    wait $job || let "FAIL+=1"
done

echo $FAIL
if [ "$FAIL" == "0" ]; then; echo "YAY!"; else; echo "FAIL! ($FAIL)"; fi;
