#!/usr/bin/perl
use warnings;
use strict;

use File::Find;
use Cwd;

=pod
 
=head1 DESCRIPTION
 
This is a pretty good first attempt at figuring out where your modules are. It is meant to follow the development of _Intermediate Perl_, and I will adhere to the idioms. 
 
=cut

my $current = cwd;

find( \&pm_beneath, $current, );


sub pm_beneath {
   use File::Basename;
   my $basename = basename($File::Find::name);
   return unless $basename =~ /\.pm$/;
   print "$File::Find::name\n";
   my $access_age = -A $basename;
   print "    $basename\n";
   printf "access age in days: %.2f\n",  $access_age;  
}

__END__


