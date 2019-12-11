#!/bin/bash
for aaa in `ls -l | grep ^d | awk -F " " '{print $NF}'`
do 
    cd $aaa;
    chmod 777 ga_work.sh;
    szrun 1 1 "./ga_work.sh";
    cd ..;
done
