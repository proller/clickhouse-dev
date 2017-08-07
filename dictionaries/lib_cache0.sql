select dictGetUInt64('lib_cache', 'user_id_hash', toUInt64(1));
select dictGetHierarchy('lib_cache' as d, key), dictIsIn(d, key, toUInt64(1)), dictIsIn(d, key, key) from system.one array join range(toUInt64(8)) as key;
select dictGetUInt32OrDefault('lib_cache', 'user_id', toUInt64(n), toUInt32(42)) from system.one array join range(8) as n;

select dictHas('lib_flat', toUInt64(n)) from system.one array join range(8) as n;
select dictHas('lib_hashed', toUInt64(n)) from system.one array join range(8) as n;
select dictHas('lib_cache', toUInt64(n)) from system.one array join range(8) as n;
select dictHas('lib_complex_integers_key_hashed', (n, n)) from system.one array join range(8) as n;                                                                                                                                                             
select dictHas('lib_complex_mixed_key_hashed', (toString(n), n)) from system.one array join range(8) as n;
                                                                                                                                                              
--select dictHas('lib_cache', 'UInt64') from system.one array join range(8) as n;                                                                              
--dict_get_query_skeleton = "select dictGet{type}('{name}', '{type}_', {key}) from system.one array join range(8) as n;"                                        
--dict_has_query_skeleton = "select dictHas('{name}', {key}) from system.one array join range(8) as n;"                                                          
--dict_get_or_default_query_skeleton = "select dictGet{type}OrDefault('{name}', '{type}_', {key}, to{type}({default})) from system.one array join range(8) as n;"
--dict_hierarchy_query_skeleton = "select dictGetHierarchy('{name}' as d, key), dictIsIn(d, key, toUInt64(1)), dictIsIn(d, key, key) from system.one array join range(toUInt64(8)) as key;"
