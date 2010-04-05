use 5.010001;
use ExtUtils::MakeMaker;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

WriteMakefile(
    NAME              => 'Algorithm::Diff::Fast',
    VERSION_FROM      => 'lib/Algorithm/Diff/Fast.pm', # finds $VERSION
    ABSTRACT_FROM     => 'lib/Algorithm/Diff/Fast.pm', # retrieve abstract from module
    AUTHOR            => 'Stuart Watt <stuart@morungos.com>',
    LIBS              => [''], # e.g., '-lm'
    DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
    INC               => '-I.', # e.g., '-I. -I/usr/include/other'
    OBJECT            => '$(O_FILES)', # link all the C files too
    BUILD_REQUIRES    => {'Test::More' => 0,
                          'Test::Deep' => 0},
    LICENSE           => 'mit',
    MIN_PERL_VERSION  => '5.10.0',
);

