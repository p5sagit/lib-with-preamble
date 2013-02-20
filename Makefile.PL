use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
  NAME => 'lib-with-preamble',
  VERSION => 0,
  PM_FILTER => 'perl my/filter',
  PREREQ_PM => { 'PerlIO::via::dynamic' => 0.02 },
);
