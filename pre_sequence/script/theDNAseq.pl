#!perl
use strict;
use warnings;

open IN, '<', $ARGV[0]
    or die $!;
open OUT, '>', $ARGV[1]
    or die $!;

while (<IN>){
    chomp;
    my @array = split /\s+/, $_;
    print OUT "$array[1] $array[3]\n";
}
close IN;
close OUT;
