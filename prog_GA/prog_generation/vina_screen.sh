#! /bin/bash

for f in ligand_ima.pdbqt; 
do
    b=`basename $f .pdbqt`
    echo Processing ligand $b
    mkdir -p $b
    /home/lhlai_pkuhpc/lustre1/jxliu/soft/autodock_vina_1_1_2_linux_x86/bin/vina --config conf.txt --ligand $f --out ${b}/$b.pdbqt --log ${b}/$b.txt
done
