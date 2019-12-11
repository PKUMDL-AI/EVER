#!perl
use strict;
use warnings;

open (IN, "< $ARGV[0]") or die $!;
open (OUT, "> AtomCoordinate");

my @temp = <>;
for (my $i=0; $i<@temp; $i++){
    unless ($temp[$i] !~/ATOM/){
        print OUT $temp[$i]
    }
}
close IN;
close OUT;
