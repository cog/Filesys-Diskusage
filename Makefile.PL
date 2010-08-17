use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Filesys::DiskUsage',
    AUTHOR              => 'Jose Castro <cog@cpan.org>',
    VERSION_FROM        => 'lib/Filesys/DiskUsage.pm',
    ABSTRACT_FROM       => 'lib/Filesys/DiskUsage.pm',
    PL_FILES            => {},
    'EXE_FILES'         => [],
    PREREQ_PM => {
        'Test::More' => 0,
        'File::Basename' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Filesys-DiskUsage-*' },
);
