
CREATE TABLE test.strings (id UInt64, str String, dt DateTime DEFAULT now()) engine = Log;
INSERT INTO test.strings SELECT number, hex(1000000+number) FROM system.numbers LIMIT 110000;
select * from test.strings;
