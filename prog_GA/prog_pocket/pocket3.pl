#!perl
use warnings;
use strict;

open IN, '<', 'output3'
    or die $!;
open OUT, '>', 'intialseq.txt'
    or die $!;

while (<IN>){
    chomp;
    my @s= split /\s+/, $_;
    if ($s[2]=~/HIS/){
        print OUT "$s[0]" . " $s[1]" . " $s[2]" . " H\n";
    }elsif($s[2]=~/GLN/){
        print OUT "$s[0]" . " $s[1]" . " $s[2]" . " Q\n";
    }elsif($s[2]=~/ARG/){
        print OUT "$s[0]" . " $s[1]" . " $s[2]" . " R\n";
    }elsif($s[2]=~/ILE/){
        print OUT "$s[0]" . " $s[1]" . " $s[2]" . " I\n";
    }elsif($s[2]=~/MET/){
        print OUT "$s[0]" . " $s[1]" . " $s[2]" . " M\n";
    }elsif($s[2]=~/THR/){
        print OUT "$s[0]" . " $s[1]" . " $s[2]" . " T\n";
    }elsif($s[2]=~/ASN/){
        print OUT "$s[0]" . " $s[1]" . " $s[2]" . " N\n";
    }elsif($s[2]=~/LYS/){
        print OUT "$s[0]" . " $s[1]" . " $s[2]" . " K\n";
    }elsif($s[2]=~/SER/){
        print OUT "$s[0]" . " $s[1]" . " $s[2]" . " S\n";
    }elsif($s[2]=~/VAL/){
        print OUT "$s[0]" . " $s[1]" . " $s[2]" . " V\n";
    }elsif($s[2]=~/ALA/){
        print OUT "$s[0]" . " $s[1]" . " $s[2]" . " A\n";
    }elsif($s[2]=~/ASP/){
        print OUT "$s[0]" . " $s[1]" . " $s[2]" . " D\n";
    }elsif($s[2]=~/GLU/){
        print OUT "$s[0]" . " $s[1]" . " $s[2]" . " E\n";
    }elsif($s[2]=~/GLY/){
        print OUT "$s[0]" . " $s[1]" . " $s[2]" . " G\n";
    }elsif($s[2]=~/PHE/){
        print OUT "$s[0]" . " $s[1]" . " $s[2]" . " F\n";
    }elsif($s[2]=~/LEU/){
        print OUT "$s[0]" . " $s[1]" . " $s[2]" . " L\n";
    }elsif($s[2]=~/TYR/){
        print OUT "$s[0]" . " $s[1]" . " $s[2]" . " Y\n";
    }elsif($s[2]=~/CYS/){
        print OUT "$s[0]" . " $s[1]" . " $s[2]" . " C\n";
    }elsif($s[2]=~/TRP/){
        print OUT "$s[0]" . " $s[1]" . " $s[2]" . " W\n";
    }elsif($s[2]=~/PRO/){
        print OUT "$s[0]" . " $s[1]" . " $s[2]" . " P\n";
    }
}
close IN;
close OUT;
system "rm -rf output1 output3";
