#!perl
use warnings;
use strict;

open IN1, '<', $ARGV[0] or die $!;
my @array= <IN1>;
chomp (@array);
close IN1;

open IN2, '<', $ARGV[1] or die $!;
my @string= <IN2>;
chomp (@string);
close IN2;

my $len1 = scalar(@array);
my $len2 = scalar(@string);
my $num =  $len1 > $len2?$len1-1:$len2-1;
open OUT, '>', $ARGV[2];

for (0..$num){
    print OUT "$array[$_] $string[$_]\n";
}
close OUT;

