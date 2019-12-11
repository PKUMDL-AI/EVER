#!/bin/bash
alias pythonsh='/apps/mdapps/mgltools_x86_64Linux2_1.5.6/bin/pythonsh';
for file in `ls -l | grep ^d |awk -F " " '{print $NF}'`
do
    cd $file;
    scap -prm 4 -min 1 -ini 1 -rtm 2 *.pdb $file\_scap.list;
    pythonsh /apps/mdapps/mgltools_x86_64Linux2_1.5.6/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_receptor4.py -r *_scap.pdb -A hydorgens -U waters -o *_scap.pdbqt;
    cp -rf /home/lhlai_pkuhpc/lustre1/jxliu/genetic_algorithm/vina_script/vina_*/* .;
    bash vina_screen.sh;
    cd ..;
done
