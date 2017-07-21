select dictGetUInt64('lib_cache', 'UInt64_', toUInt64(1));
select dictGetHierarchy('lib_cache' as d, key), dictIsIn(d, key, toUInt64(1)), dictIsIn(d, key, key) from system.one array join range(toUInt64(8)) as key;
select dictGetUInt32OrDefault('lib_cache', 'UInt32_', toUInt64(n), toUInt32(42)) from system.one array join range(8) as n;

select dictHas('lib_flat', toUInt64(n)) from system.one array join range(8) as n;
select dictGetUInt8('lib_flat', 'UInt8_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetUInt8OrDefault('lib_flat', 'UInt8_', toUInt64(n), toUInt8(42)) from system.one array join range(8) as n;
select dictGetUInt16('lib_flat', 'UInt16_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetUInt16OrDefault('lib_flat', 'UInt16_', toUInt64(n), toUInt16(42)) from system.one array join range(8) as n;
select dictGetUInt32('lib_flat', 'UInt32_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetUInt32OrDefault('lib_flat', 'UInt32_', toUInt64(n), toUInt32(42)) from system.one array join range(8) as n;
select dictGetUInt64('lib_flat', 'UInt64_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetUInt64OrDefault('lib_flat', 'UInt64_', toUInt64(n), toUInt64(42)) from system.one array join range(8) as n;
select dictGetInt8('lib_flat', 'Int8_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetInt8OrDefault('lib_flat', 'Int8_', toUInt64(n), toInt8(-42)) from system.one array join range(8) as n;
select dictGetInt16('lib_flat', 'Int16_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetInt16OrDefault('lib_flat', 'Int16_', toUInt64(n), toInt16(-42)) from system.one array join range(8) as n;
select dictGetInt32('lib_flat', 'Int32_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetInt32OrDefault('lib_flat', 'Int32_', toUInt64(n), toInt32(-42)) from system.one array join range(8) as n;
select dictGetInt64('lib_flat', 'Int64_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetInt64OrDefault('lib_flat', 'Int64_', toUInt64(n), toInt64(-42)) from system.one array join range(8) as n;
select dictGetFloat32('lib_flat', 'Float32_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetFloat32OrDefault('lib_flat', 'Float32_', toUInt64(n), toFloat32(1.5)) from system.one array join range(8) as n;
select dictGetFloat64('lib_flat', 'Float64_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetFloat64OrDefault('lib_flat', 'Float64_', toUInt64(n), toFloat64(1.6)) from system.one array join range(8) as n;
select dictGetString('lib_flat', 'String_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetStringOrDefault('lib_flat', 'String_', toUInt64(n), toString('explicit-default')) from system.one array join range(8) as n;
select dictGetDate('lib_flat', 'Date_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetDateOrDefault('lib_flat', 'Date_', toUInt64(n), toDate('2015-01-01')) from system.one array join range(8) as n;
select dictGetDateTime('lib_flat', 'DateTime_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetDateTimeOrDefault('lib_flat', 'DateTime_', toUInt64(n), toDateTime('2015-01-01 00:00:00')) from system.one array join range(8) as n;
select dictGetHierarchy('lib_flat' as d, key), dictIsIn(d, key, toUInt64(1)), dictIsIn(d, key, key) from system.one array join range(toUInt64(8)) as key;
select dictHas('lib_hashed', toUInt64(n)) from system.one array join range(8) as n;
select dictGetUInt8('lib_hashed', 'UInt8_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetUInt8OrDefault('lib_hashed', 'UInt8_', toUInt64(n), toUInt8(42)) from system.one array join range(8) as n;
select dictGetUInt16('lib_hashed', 'UInt16_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetUInt16OrDefault('lib_hashed', 'UInt16_', toUInt64(n), toUInt16(42)) from system.one array join range(8) as n;
select dictGetUInt32('lib_hashed', 'UInt32_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetUInt32OrDefault('lib_hashed', 'UInt32_', toUInt64(n), toUInt32(42)) from system.one array join range(8) as n;
select dictGetUInt64('lib_hashed', 'UInt64_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetUInt64OrDefault('lib_hashed', 'UInt64_', toUInt64(n), toUInt64(42)) from system.one array join range(8) as n;
select dictGetInt8('lib_hashed', 'Int8_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetInt8OrDefault('lib_hashed', 'Int8_', toUInt64(n), toInt8(-42)) from system.one array join range(8) as n;
select dictGetInt16('lib_hashed', 'Int16_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetInt16OrDefault('lib_hashed', 'Int16_', toUInt64(n), toInt16(-42)) from system.one array join range(8) as n;
select dictGetInt32('lib_hashed', 'Int32_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetInt32OrDefault('lib_hashed', 'Int32_', toUInt64(n), toInt32(-42)) from system.one array join range(8) as n;
select dictGetInt64('lib_hashed', 'Int64_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetInt64OrDefault('lib_hashed', 'Int64_', toUInt64(n), toInt64(-42)) from system.one array join range(8) as n;
select dictGetFloat32('lib_hashed', 'Float32_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetFloat32OrDefault('lib_hashed', 'Float32_', toUInt64(n), toFloat32(1.5)) from system.one array join range(8) as n;
select dictGetFloat64('lib_hashed', 'Float64_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetFloat64OrDefault('lib_hashed', 'Float64_', toUInt64(n), toFloat64(1.6)) from system.one array join range(8) as n;
select dictGetString('lib_hashed', 'String_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetStringOrDefault('lib_hashed', 'String_', toUInt64(n), toString('explicit-default')) from system.one array join range(8) as n;
select dictGetDate('lib_hashed', 'Date_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetDateOrDefault('lib_hashed', 'Date_', toUInt64(n), toDate('2015-01-01')) from system.one array join range(8) as n;
select dictGetDateTime('lib_hashed', 'DateTime_', toUInt64(n)) from system.one array join range(8) as n;
select dictGetDateTimeOrDefault('lib_hashed', 'DateTime_', toUInt64(n), toDateTime('2015-01-01 00:00:00')) from system.one array join range(8) as n;
select dictGetHierarchy('lib_hashed' as d, key), dictIsIn(d, key, toUInt64(1)), dictIsIn(d, key, key) from system.one array join range(toUInt64(8)) as key;
select dictHas('lib_cache', toUInt64(n)) from system.one array join range(8) as n;
select dictGetUInt8('lib_cache', 'UInt8_', toUInt64(n)) from system.one array join range(8) as n;
                                                                                                                                                             
                                                                                                                                                              
--select dictHas('lib_cache', 'UInt64') from system.one array join range(8) as n;                                                                              
--dict_get_query_skeleton = "select dictGet{type}('{name}', '{type}_', {key}) from system.one array join range(8) as n;"                                        
--dict_has_query_skeleton = "select dictHas('{name}', {key}) from system.one array join range(8) as n;"                                                          
--dict_get_or_default_query_skeleton = "select dictGet{type}OrDefault('{name}', '{type}_', {key}, to{type}({default})) from system.one array join range(8) as n;"
--dict_hierarchy_query_skeleton = "select dictGetHierarchy('{name}' as d, key), dictIsIn(d, key, toUInt64(1)), dictIsIn(d, key, key) from system.one array join range(toUInt64(8)) as key;"
