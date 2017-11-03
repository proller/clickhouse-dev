#!/usr/bin/env bash

pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
for i in {1..5}; do
${pwd}/test.sh --random --testname &
done

# for i in {1..5000}; do
#    sleep 0.1
#    ${pwd}/client.sh --query="KILL QUERY WHERE 1"
# done

for job in `jobs -p`; do
    echo $job
    wait $job || let "FAIL+=1"
done

echo $FAIL
if [ "$FAIL" == "0" ]; then; echo "YAY!"; else; echo "FAIL! ($FAIL)"; fi;
