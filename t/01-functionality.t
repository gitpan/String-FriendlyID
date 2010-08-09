#!/usr/bin/perl -T

use Test::More tests => 9;

BEGIN {
    use_ok( 'String::FriendlyID' ) || print "Bail out!
";
}

my $class = 'String::FriendlyID';
my $fid = $class->new();

is( 
    $fid->friendly_number('639178680102'), 
    '64K5QW8VJ',    
    'generate friendly number',
);

is( 
    $fid->encode('639178680102'), 
    '4HSJAC9XD',    
#    '4TJE8C94F', # friendly ID generates a different string, never the less unique, this is still valid
    'encode numerical string',
);

is( 
    $fid->encode(639178680102), 
    '4HSJAC9XD',    
#    '4TJE8C94F', # friendly ID generates a different string, never the less unique, this is still valid
    'encode number',
);

is(
    $fid->encode('639178680102'), 
    $fid->encode('639178680102'),
    'unique per string - same string',
);

is(
    $fid->encode('639178680102'), 
    $fid->encode(639178680102),
    'same value, one numberic one string',
);

isnt(
    $fid->encode('639178680102'), 
    $fid->encode('639177654321'),
    'unique per string - different strings',
);

is(
    $fid->encode('abcdefg'), 
    '', 
    'non-numeric empty'
);

is(
    $fid->encode('1A2B3C'),
    '', 
    'with non-numeric'
);
