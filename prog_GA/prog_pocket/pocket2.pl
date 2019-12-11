#!perl
use strict;
use warnings;

open IN, '<', $ARGV[0]
    or die $!;
open OUT, '>', 'output2';

my @file=<>;
for (my $i=0; $i<@file; $i++){
    unless ($file[$i] !~/ATOM/){
        print OUT $file[$i];
    }
}
close IN;
close OUT;
system "uniq output2 > output3";
system "rm -rf output2";
