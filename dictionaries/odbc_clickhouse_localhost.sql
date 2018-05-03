
select * from odbc('DSN=clickhouse_localhost_system', 'build_options');
--select * from odbc('Driver=clickhouse_localhost;Database=dictionary.sqlite', 'test');
select dictGetString('odbc_clickhouse_localhost', 'value', tuple('VERSION_FULL'));

select * from odbc('DSN=SQLite3;Database=dictionary.sqlite', 'test');
select * from odbc('Driver=SQLite3;Database=dictionary.sqlite', 'test');
select dictGetString('odbc_sqlite', 'value', tuple('VERSION_FULL'));
