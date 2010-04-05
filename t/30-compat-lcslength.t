# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl base.t'
use strict;
$^W++;
use lib qw(blib lib);
use Algorithm::Diff::Fast qw(LCS_length);
use Test::More;

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

my @correctResult = qw(b c e j l m);
my $correctResult = join(' ', @correctResult);

my $length = LCS_length( \@a, \@b );
is( $length, 6, "LCS length is 6");
