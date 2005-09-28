use inc::Module::Install;

name          ( 'HTML-Location'              );
abstract      ( 'Working with disk to URI file mappings (deprecated: see URI::ToDisk)' );
author        ( 'Adam Kennedy <cpan@ali.as>' );
version_from  ( 'lib/HTML/Location.pm'       );
license       ( 'perl'                       );
requires      ( 'perl'            => '5.005' );
requires      ( 'Clone'           => '0.13'  );
requires      ( 'List::Util'      => '1.11'  );
requires      ( 'URI'             => 0       );
build_requires( 'Test::More'      => '0.47'  );
build_requires( 'File::Spec'      => '0.80'  );

auto_install();

&WriteAll;
