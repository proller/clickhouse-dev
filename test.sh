
pwd=`pwd`
cd ../dbms/tests/
./clickhouse-test --no-shard -c "../../build$BUILD_TYPE/dbms/src/Server/clickhouse --client --config ${pwd}/clickhouse-client.xml" $*
