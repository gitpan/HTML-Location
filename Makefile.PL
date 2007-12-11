use strict;
use vars qw{$VERSION};
BEGIN {
	require 5.003_96;
	$VERSION = '1.02';
}
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME      => 'HTML::Location',
	ABSTRACT  => 'Working with disk to URI file mappings (deprecated: see URI::ToDisk)',
	VERSION   => $VERSION,
	PREREQ_PM => {
		'Test::More' => '0.47',
		'File::Spec' => '0.80',
		'Clone'      => '0.31',
		'List::Util' => '1.11',
		'URI'        => 0,
	},
	($] >= 5.005 ? (
		AUTHOR => 'Adam Kennedy <adamk@cpan.org>',
	) : ()),
	($ExtUtils::MakeMaker::VERSION ge '6.30_00' ? (
		LICENSE => 'perl',
	) : ()),
);

