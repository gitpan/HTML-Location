require 5.000;
use ExtUtils::MakeMaker;
WriteMakefile(
	'NAME'         => 'HTML::Location',
	'VERSION_FROM' => 'lib/HTML/Location.pm',
	'PREREQ_PM'    => {
		File::Spec => 0.83,
		Test::More => 0,
		List::Util => 1.11,
	},
	($] >= 5.005) ? (
		'AUTHOR'   => 'Adam Kennedy (cpan@ali.as)',
		'ABSTRACT' => 'Working with disk to URI file mappings',
	) : (),
);
