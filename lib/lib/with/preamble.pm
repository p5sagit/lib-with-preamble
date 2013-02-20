package lib::with::preamble;

use strict;
use warnings FATAL => 'all';
use File::Spec;
use PerlIO::via::dynamic;

sub require_with_preamble {
  my ($arrayref, $filename) = @_;
  my (undef, $preamble, @libs) = @$arrayref;
  foreach my $cand (map File::Spec->catfile($_, $filename), @libs) {
    if (-f $cand) {
      if (open my $fh, '<', $cand) {
        return with_preamble($preamble."\n#line 1 $cand\n", $fh);
      }
    }
  }
}

sub with_preamble {
  my ($preamble, $fh) = @_;
  PerlIO::via::dynamic->new(untranslate => sub {
    $preamble and $_[1] =~ s/\A/$preamble/, undef($preamble);
  })->via($fh);
  return $fh;
}

sub import {
  my ($class, $preamble, @libs) = @_;
  return unless defined($preamble) and @libs;
  unshift @INC, [ \&require_with_preamble, $preamble, @libs ];
}

1;
