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
        'Test::Warn' => 0,
        'File::Basename' => 0,
        'File::Temp' => 0,
    },
    META_MERGE => {
        resources => {
            repository => 'http://github.com/cog/Filesys-Diskusage',
            bugtracker => 'http://rt.cpan.org/Public/Dist/Display.html?Name=Filesys-DiskUsage',
            license    => 'http://dev.perl.org/licenses/',
        },
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Filesys-DiskUsage-*' },
);
