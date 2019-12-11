#!/bin/bash
mkdir das_gen3d_atp;
for file in `awk -F " " '{print$1}' das_gen3d.txt`;do
    cp -rf ../atp_nomg/gen3d/$file/ligand_atp/$file.pdb ./das_gen3d_atp/$file.pdb;
done

sleep 1;

cd das_gen3d_atp;
obabel *.pdb -O *.sdf -d;
rm -rf *.pdb;
cd ..;
