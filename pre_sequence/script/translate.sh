#!/bin/bash
for name in `ls *.seq|awk -F "." '{print$1}'`;do
    /home/lhlai_pkuhpc/lustre1/jxliu/genetic_algorithm/pre_sequence/GA $name.seq rna_$name pro_$name;
    perl combine_rank.pl pro_$name rna_$name all_$name;
done

cat all_* > generation_all;

rm -rf pro_* rna_* all_*;
