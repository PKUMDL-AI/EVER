#!perl
use strict;
use warnings;

open IN, '<', $ARGV[0]
    or die $!;
open OUT, '>', 'output1'
    or die $!;
while (<IN>){
    chomp;
    my @string=split;
    my @type=$string[0];
    my @aa=$string[3];
    my @number=$string[5];
    my @chain=$string[4];
    print OUT "@number @chain @aa @type\n";
}
