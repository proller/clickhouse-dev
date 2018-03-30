select * from odbc('DSN=clickhouse_localhost', 'system.build_options');
select dictGetString('odbc_clickhouse_localhost', 'value', tuple('VERSION_FULL'));
