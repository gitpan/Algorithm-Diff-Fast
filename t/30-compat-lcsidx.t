# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl base.t'
use strict;
$^W++;
use lib qw(blib lib);
use Algorithm::Diff::Fast qw(LCSidx);
use Test::More;

BEGIN
{
	$|++;
	plan tests => 2;
	$SIG{__DIE__} = sub # breakpoint on die
	{
		$DB::single = 1;
		$DB::single = 1;	# avoid complaint
		die @_;
	}
}

my @a = qw(a b c e h j l m n p);
my @b = qw(b c d e f j k l m r s t);

my @correctResult1 = qw(1 2 3 5 6 7);
my $correctResult1 = join(' ', @correctResult1);
my @correctResult2 = qw(0 1 3 5 7 8);
my $correctResult2 = join(' ', @correctResult2);

my ($lcs1, $lcs2) = LCSidx( \@a, \@b );
is( "@$lcs1", $correctResult1, "First sequence indices correct" );
is( "@$lcs2", $correctResult2, "Second sequence indices correct" );
