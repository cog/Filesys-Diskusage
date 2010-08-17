use Test::More tests => 2;
use Test::Warn;

BEGIN {
    use_ok( 'Filesys::DiskUsage', 'du' );
}

warning_is {du( { recursive => 1, 'max-depth' => 1 } , <t/samples/*> )} "could not open t/samples/unreadable (Permission denied)\n";

