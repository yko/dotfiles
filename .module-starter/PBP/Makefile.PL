#!/usr/bin/env perl

use strict;
use warnings;

use inc::Module::Install;

name '<DISTRO>';

all_from '<MAIN PM FILE>';
author 'Yaroslav Korshak <yko@cpan.org>';
license 'perl';

test_requires 'Test::More';

tests 't/*.t t/*/*.t';

no_index directory => 't';

my $distro = lc('<DISTRO>');
resources
  bugtracker => 'http://github.com/yko/' . $distro . '/issues',
  repository => 'http://github.com/yko/' . $distro,
  license    => 'http://dev.perl.org/licenses/';

auto_install;

WriteAll;
