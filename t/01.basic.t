use Test::More tests => 17;

BEGIN {
    use_ok( 'Filesys::DiskUsage', 'du' );
}

is( du(), 0 );

is( du( { recursive => 0 }, "t/samples" ), 0 );

is( du( { recursive => 0 }, <t/samples/[1-8]> ), 30 );

is_deeply( [ du( sort <t/samples/[1-8]> ) ] , [4,4,4,5,5,4,2,2] );

is_deeply( {du( { 'make-hash' => 1 }, 't/samples/1' )},{ 't/samples/1' => 4 } );

is( du( { recursive => 0 } , <t/samples/*> ), 30 );

is( du( { 'show-warnings' => 0, recursive => 1, 'max-depth' => 1 } , <t/samples/*> ), 38 );

is( du( { 'show-warnings' => 0, recursive => 1, 'max-depth' => 1 } , 't/samples' ), 30 );

is( du( { 'show-warnings' => 0, recursive => 1 } , 't/samples' ), 38 );

is( du( { 'show-warnings' => 0, recursive => 1 , exclude => qr/1/ } , 't/samples' ), 34 );

is( du( { 'show-warnings' => 0, recursive => 1 , exclude => qr/[12]/ } , 't/samples' ), 30 );

is( du( { 'show-warnings' => 0, recursive => 1 , exclude => qr/\d/ } , 't/samples' ), 0 );

is( du( { recursive => 0 , 'human-readable' => 1 , 'truncate-readable' => 0 } , 't/samples' ), '0B' );

is( du( { recursive => 0 , 'human-readable' => 1 , 'truncate-readable' => -1 } , 't/samples' ),'0B' );

is( du( { recursive => 0 , 'human-readable' => 1 } , 't/samples' ), '0.00B' );

is( du( { recursive => 0 , 'Human-readable' => 1 } , 't/samples' ), '0.00B' );
