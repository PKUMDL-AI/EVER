#!/bin/bash
perl theDNAseq.pl uniq_generation rnaseq;
/home/lhlai_pkuhpc/lustre1/jxliu/genetic_algorithm/pre_sequence/mutation_number rnaseq /home/lhlai_pkuhpc/lustre1/jxliu/genetic_algorithm/pre_sequence/sequence/abl.fasta rnadif;
grep LINE rnadif | awk -F " " '{print$3 " " $6}' > gen1d_seq;
