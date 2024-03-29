# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl base.t'
use strict;
$^W++;
use lib qw(blib lib);
use Algorithm::Diff::Fast qw(compact_diff);
use Test::More;
use Test::Deep;

BEGIN
{
	$|++;
	plan tests => 1;
	$SIG{__DIE__} = sub # breakpoint on die
	{
		$DB::single = 1;
		$DB::single = 1;	# avoid complaint
		die @_;
	}
}

my @a = qw(a b c e h j l m n p);
my @b = qw(b c d e f j k l m r s t);

# From the Algorithm::Diff manpage:

# Note: this test was amended as part of Algorithm::Diff::Fast, as the original
# test was actually not from the Algorithm::Diff manpage, but had its order
# rather arbitrarily modified. This is actually the correct order from the manpage
# note that the contents of a hunk cannot always be assumed to be identical to
# Algorithm::Diff for this reason. Algorithm::Diff::Fast always puts deletions 
# before insertions in a hunk. 

my $correctDiffResult = [
    0,  0,
    0,  0,
    1,  0,
    3,  2,
    3,  3,
    4,  4,
    5,  5,
    6,  6,
    6,  7,
    8,  9,
    10, 12
];

# Compare the diff output with the one from the Algorithm::Diff manpage.
my $diff = compact_diff( \@a, \@b );
cmp_deeply($diff, $correctDiffResult, "Got correct compact diff");
