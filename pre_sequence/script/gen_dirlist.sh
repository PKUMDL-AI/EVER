#!/bin/bash
#/apps/mdapps/mgltools_x86_64Linux2_1.5.6/bin/pythonsh /home/lhlai_pkuhpc/lustre1/dengb/BCR-ABL/test/gen_mutlist.py
dirlist=(`cat mutlist | awk -F " " '{print $1}'`)
mutant=(`cat mutlist | awk -F " " '{print $2}'`)
scap=(`cat mutlist | awk -F " " '{print $3}'`)
len=${#dirlist[@]}
for ((i=0;i<"$len";i=i+1)); do
    mkdir -p ${dirlist[$i]}
    cp -rf *.pdb conf.txt ${dirlist[$i]}
    echo ${mutant[$i]} >> ${dirlist[$i]}/${dirlist[$i]}.list
    echo ${scap[$i]} >> ${dirlist[$i]}/${dirlist[$i]}_scap.list
done
	
