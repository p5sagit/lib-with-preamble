use strict;
use warnings FATAL => 'all';
use 5.008001;
use ExtUtils::MakeMaker;
(do 'maint/Makefile.PL.include' or die $@) unless -f 'META.yml';

WriteMakefile(
  NAME => 'lib-with-preamble',
  VERSION_FROM => 'lib/lib/with/preamble.pm',
  PM_FILTER => 'perl my/filter',
  PREREQ_PM => { 'PerlIO::via::dynamic' => 0.02 },
);
