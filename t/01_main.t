#!/usr/bin/perl

# Formal testing for HTML::Location

use strict;
use File::Spec::Functions qw{:ALL};
use lib catdir( updir(), updir(), 'modules' ), # Development testing
        catdir( updir(), 'lib' );              # Installation testing
use UNIVERSAL 'isa';
use Test::More tests => 107;
use Scalar::Util 'refaddr';

# Check their perl version
BEGIN {
	$| = 1;
	ok( $] >= 5.005, "Your perl is new enough" );
}





# Does the module load
use_ok( 'HTML::Location' );



# Create a basic test location
my $location = HTML::Location->new( '/foo', 'http://foo.com' );
is_normal_location( $location );
is( $location->path, '/foo', '->path gives expected value' );
is( $location->uri, 'http://foo.com/', '->uri returns expected value' );


my $clone = $location->clone;
is_normal_location( $clone );
is( $clone->path, '/foo', '->path gives expected value' );
is( $clone->uri, 'http://foo.com/', '->uri returns expected value' );
isnt( refaddr($clone), refaddr($location), 'Clone is different to original' );





# Do a basic file addition
my $file = $location->catfile( 'foo', 'bar.txt' );
is_normal_location( $file );
isnt( refaddr($location), refaddr($file), '->catfile returns a new object' );
is( $file->path, '/foo/foo/bar.txt', '->path gives expected value' );
is( $file->uri, 'http://foo.com/foo/bar.txt', '->uri returns expected value' );

# Has the method call changed the original object?
is_normal_location( $location );
is( $location->path, '/foo', '->path gives expected value' );
is( $location->uri, 'http://foo.com/', '->uri returns expected value' );





# Do a basic directory addition
my $dir = $location->catdir( 'foo', 'bar' );
is_normal_location( $file );
isnt( refaddr($location), refaddr($dir), '->catfile returns a new object' );
is( $dir->path, '/foo/foo/bar', '->path gives expected value' );
is( $dir->uri, 'http://foo.com/foo/bar', '->uri returns expected value' );

# Has the method call changed the original object?
is_normal_location( $location );
is( $location->path, '/foo', '->path gives expected value' );
is( $location->uri, 'http://foo.com/', '->uri returns expected value' );





exit();





# Do a series of basic checks on a location
sub is_normal_location {
	my $object = shift;
	ok(     defined $object, '->new returns defined' );
	ok(     $object, '->new returns true' );
	isa_ok( $object, 'HTML::Location' );
	ok(     defined $object->path, '->path returns defined' );
	ok(     ! ref $object->path, "->path doesn't return a reference" );
	ok(     length $object->path, "->path doesn't return a zero length string" );
	ok(     defined $object->URI, "->URI returns defined" );
	ok(     ref $object->URI, "->URI returns a reference" );
	isa_ok( $object->URI, 'URI' );
	isnt(   refaddr($object->URI), refaddr($object->URI), '->URI returns a clone' );
	ok(     defined $object->uri, '->uri returns defined' );
	ok(     ! ref $object->uri, "->uri doesn't return a reference" );
	ok(     length $object->uri, "->uri doesn't return a null string" );
	ok(     length "$object", "Location stringifies to a non-null string" );
	is(     $object->uri, "$object", "Location stringifies to the ->uri value" );
}

1;
