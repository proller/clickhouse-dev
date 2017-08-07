select dictGetUInt64('lib_cache_test1', 'user_id_hash', toUInt64(1));
select dictGetUInt64OrDefault('lib_cache_test1', 'user_id', toUInt64(n), toUInt64(42)) from system.one array join range(8) as n;
select dictHas('lib_cache_test1', toUInt64(n)) from system.one array join range(8) as n;
                                                                                                                                                              
-- select dictGetHierarchy('lib_cache_test1' as d, key), dictIsIn(d, key, toUInt64(1)), dictIsIn(d, key, key) from system.one array join range(toUInt64(8)) as key;

--select dictHas('lib_cache_test1', toUInt64(n)) from system.one array join range(1000000) as n;

--select dictHas('lib_cache', 'UInt64') from system.one array join range(8) as n;                                                                              
--dict_get_query_skeleton = "select dictGet{type}('{name}', '{type}_', {key}) from system.one array join range(8) as n;"                                        
--dict_has_query_skeleton = "select dictHas('{name}', {key}) from system.one array join range(8) as n;"                                                          
--dict_get_or_default_query_skeleton = "select dictGet{type}OrDefault('{name}', '{type}_', {key}, to{type}({default})) from system.one array join range(8) as n;"
--dict_hierarchy_query_skeleton = "select dictGetHierarchy('{name}' as d, key), dictIsIn(d, key, toUInt64(1)), dictIsIn(d, key, key) from system.one array join range(toUInt64(8)) as key;"
