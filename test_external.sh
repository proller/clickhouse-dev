pwd=`pwd`
#cd ../dbms/tests/
#./clickhouse-test -c "../../clang_msan/dbms/src/Server/clickhouse --client --config ${pwd}/config-client.xml "
#./clickhouse-test --no-shard -c "../../build/dbms/src/Server/clickhouse --client --config ${pwd}/config-client.xml "
cd ../dbms/tests/external_dictionaries/
./generate_and_test.py --port=19000 --no_break --no_mongo  --no_mysql
