#!perl
use warnings;
use strict;

open IN, '<', $ARGV[0]
    or die $!;

my $num = 4;
while (<IN>){
    chomp;
    my @array = split /\s+/, $_;
    for ($num=4; $num<=$#array; $num++){
        if ($array[3] ne $array[$num]){
            my $i= $num-3;
            system "mkdir -p $i";
            open OUT1, '>>', "./$i/$i\_scap.list";
            open OUT2, '>>', "./$i/$i.list";
            print OUT1 "$array[1]," . "$array[0]" . ',' . "$array[$num]" . "\n";
            print OUT2 "$array[3]" . "$array[0]" . "$array[$num]" . "\n";
            system "cp -rf /home/lhlai_pkuhpc/lustre1/jxliu/genetic_algorithm/protein_structure/*.pdb ./$i";
        }
        close OUT;
    }
}
close IN;
