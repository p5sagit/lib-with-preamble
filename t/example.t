use strict;
use warnings FATAL => 'all';
use Test::More qw(no_plan);
use lib::with::preamble 'use v5.10;', 't/lib';

ok(eval { require my_given_example; 1 }, 'Loaded module');

sub result_for { eval { my_given_example::example_sub($_[0]) } }

is(result_for(1), 'positive');
is(result_for(-1), 'negative');
is(result_for(0), 'zero');

is(my_given_example::my_file(), 't/lib/my_given_example.pm');
is(my_given_example::my_line(), 12);
