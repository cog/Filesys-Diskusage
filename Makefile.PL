use strict;
use warnings;
use ExtUtils::MakeMaker;

my %conf = (
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
        'File::Find' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Filesys-DiskUsage-*' },
);

if (eval { ExtUtils::MakeMaker->VERSION(6.3002) }) {
	$conf{LICENSE} = 'perl';
}


if (eval { ExtUtils::MakeMaker->VERSION(6.46) }) {
	$conf{META_MERGE} = {
		'meta-spec' => { version => 2 },
		resources => {
			repository => {
				type => 'git',
				url  => 'http://github.com/szabgab/Filesys-DiskUsage.git',
				web  => 'http://github.com/szabgab/Filesys-DiskUsage',
			}
		}
	};
}
#            repository => 'http://github.com/cog/Filesys-Diskusage',
#            bugtracker => 'http://rt.cpan.org/Public/Dist/Display.html?Name=Filesys-DiskUsage',
#            license    => 'http://dev.perl.org/licenses/',


WriteMakefile(%conf);
