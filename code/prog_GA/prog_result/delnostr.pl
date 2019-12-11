#!perl
use strict;
#use warnings;

open IN, '<', $ARGV[0] or die $!;
my @number;
while(my $lines=<IN>){
   chomp $lines;
   $lines =~ s/\s+//g; 
   push(@number,$lines);
   #print $lines,"\n";
}
#print "@number\n";
close IN;

open IN1, '<', $ARGV[1] or die $!;
while (<IN1>){
    chomp;
    my @array=split /\s+/, $_;
    open OUT, '>>', $ARGV[2] or die $!;
    for (my $i=0;$i<=$#number;++$i){
    if ($array[0] == $number[$i]){
        print OUT "$array[0] $array[1] $array[4] $array[5]\n";
    }
}
close OUT;
}
close IN1;

#open IN, '<', $ARGV[1] or die $!;
#my %hash;
#while(<IN>){
#    chomp;
#    my @temp=split /\s+/,$_;
#    #print "$temp[3]\n";
#    $hash{$temp[1]}= $temp[3];
#}
#close IN;

#foreach my $keys (@number){
#    open OUT, '>', "$.seq";
#    print OUT "$hash{$keys}";
#}
