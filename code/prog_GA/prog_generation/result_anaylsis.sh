#!/bin/bash
for file in `ls -l | grep ^d |awk -F " " '{print$NF}'`
do
    sed -n '/MODEL 1/,/ENDMDL/{p}' $file/ligand_*/ligand_*.pdbqt > ./$file/ligand_*/$file.pdbqt;
    pythonsh /apps/mdapps/mgltools_x86_64Linux2_1.5.6/MGLToolsPckgs/AutoDockTools/Utilities24/pdbqt_to_pdb.py -f ./$file/ligand_*/$file.pdbqt -o ./$file/ligand_*/$file.pdb;
    awk 'NR==2 || $4 ~/-d.d/ {printf "%d %-2.1f\n", '$file', $4 >> "dock_result";}' $file/ligand_*/ligand_*.pdbqt;
    awk -F "," '{printf "%d:%s,\n", '$file',$1 >> "mutation";}' $file/$file.list;
done

awk -F ":" '{if(!a[$1]++)b[++n]=$1;c[$1]=c[$1]$2}END{for(i=1;i<=n;i++)print b[i]":"c[b[i]]}' mutation > mutation.txt;

#awk '{a[$1]=b[$1]++?a[$1] OFS $2:$2}END{for (i in a) print i FS a[i]}' OFS=":" mutation > mutation.txt;
rm -rf mutation;

perl combine_rank.pl dock_result mutation.txt dock_generation.txt;

rm -rf mutation.txt;

cat dock_generation.txt | sort -n -r  -k 2 > generation_result.txt;

#rm -rf dock_result.txt
