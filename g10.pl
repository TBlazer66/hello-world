#!/usr/bin/perl
use warnings;
use strict;

use File::Find;
use Cwd;

=pod
 
=head1 DESCRIPTION
 
returns pms with n days
 
=cut

my $current = cwd;

find( \&pm_beneath, $current, );


sub pm_beneath {
   use File::Basename;

   my $days = 3; #hard-coded 
   my $basename = basename($File::Find::name);
   return unless $basename =~ /\.pm$/;
 
   my $access_age = -A $basename;
   return if ($access_age > $days);
   print "$File::Find::name\n";
   printf "$basename: access age in days: %.4f\n\n",  $access_age;  
}

__END__


