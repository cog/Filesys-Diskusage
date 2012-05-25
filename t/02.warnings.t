use Test::More;
use Test::Warn;

use File::Temp qw(tempdir);
use Filesys::DiskUsage qw(du);

plan skip_all => 'no chmod on Windows' if $^O =~ /win32/i;

plan tests => 2;

my $dir = tempdir( CLEANUP => 1 );
#diag $dir;

{
	open my $fh, '>', "$dir/readable" or die;
	print $fh "hello";
	close $fh;
}

{
	mkdir "$dir/sub";
	open my $fh, '>', "$dir/sub/unreadable" or die;
	print $fh "other";
	close $fh;
	chmod 0, "$dir/sub";
}

my $du;
warning_like {$du =du( $dir )}
	qr{^could not open $dir/sub \(Permission denied\)$},
	'warning for permission denied';
is $du, 5, 'size of one file';
