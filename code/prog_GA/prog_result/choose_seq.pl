#!perl
use strict;
use warnings;

my %seq=&getSeq($ARGV[0]);
my @target=&getTarget($ARGV[1]);
my @result;

sub getSeq{
    my ($a)=@_;
    my %hash;
    open (IN, $a) or die $!;
    while (<IN>){
        s/[\r\n]//g;
        my @temp=split /\s+/, $_;
        $hash{$temp[0]}=$temp[1];
    }
    close IN;
    return %hash;
}

sub getTarget{
    my ($a)=@_;
    my @array;
    open (IN, $a) or die $!;
    while (<IN>){
        s/[\r\n]//g;
        push @array, $_;
    }
    close IN;
    return @array;
}

foreach my $key(@target){
    if (exists $seq{$key}){
        my $temp = $key . " " . $seq{$key} . "\n";
        push @result, $temp;
    }
}

open OUT, ">", $ARGV[2] or die $!;
foreach(@result){
    print OUT $_;
}
close OUT;
