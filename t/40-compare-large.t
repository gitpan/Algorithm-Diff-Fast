use strict;
use warnings;

use Test::More tests => 4;

use Algorithm::Diff::Fast qw(LCS_length diff);

my $seq1 = do("t/seq1.txt");
my $seq2 = do("t/seq2.txt");

is($#$seq1, 381148, "Got first sequence");
is($#$seq2, 381345, "Got second sequence");

my $differences = Algorithm::Diff::Fast::LCS_length($seq1, $seq2);
is($differences, 381146, "Found a lot in common");

my @hunks = Algorithm::Diff::Fast::diff($seq1, $seq2);
is(@hunks, 10, "Found 10 diffable hunks");