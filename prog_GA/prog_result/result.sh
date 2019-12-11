#!/bin/bash
perl combine_rank.pl gen3d_nomg gen3d_das gen3d;
sleep 1;
perl delnostr.pl gen3d_mg gen3d gen3d_1;
sleep 1;
perl result_extrace.pl gen3d_1 gen3d_result;
sleep 1;
awk -F " " '{print$1}' gen3d_result > gen3d_num;
sleep 1;
perl choose_seq.pl gen3d_seq gen3d_num gen3d_mut;
sleep 1;
perl combine_rank.pl gen3d_result gen3d_mut das_gen3d.txt;
sleep 1;
rm -rf gen3d;
rm -rf gen3d_1;
rm -rf gen3d_result;
rm -rf gen3d_num;
rm -rf gen3d_mut;
