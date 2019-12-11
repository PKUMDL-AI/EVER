#!perl
use strict;
use warnings;

open (IN,"<$ARGV[0]") or die $!;
open (OUT,">$ARGV[1]") or die $!;
while (<IN>){
    #my $energy = <STDIN>;
    chomp;
    my @temp = split /\s+/, $_;
    $temp[4] = $temp[2] - (-10.3);
    $temp[5] = -7.3 - $temp[1];
    if ($temp[5] > 0 && $temp[4] > 0){
        printf OUT "%d %.1f %.1f %.1f %s\n", $temp[0], $temp[2], $temp[4], $temp[5], $temp[3];
    }
}
close IN;
close OUT;
