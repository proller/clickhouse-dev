#!/usr/bin/env perl
use 5.16.0;

for my $n (0..1000) {
 say qq{select dictGetUInt64('dictionary_executable_cache_many', 'ParentID', toUInt64($n));}
}
