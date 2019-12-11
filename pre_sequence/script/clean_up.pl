#!perl
use warnings;
use strict;

open IN, '<', $ARGV[0] or die $!;
open OUT, '>', 'output1';
my @rows;
while (<IN>){
    chomp;
    my @seq=split '';
    for (0..$#seq){
        $rows[$_] .= $seq[$_] . " ";
    }
}
print  OUT "$_\n" foreach (@rows);
