#!/bin/bash
ls -l | grep ^d| awk -F " " '{print$NF}'>list;

awk 'NR%50==1{++p}{print >>"list_"p}{close("list_"p)}' list

for aaa in `ls list_*|awk -F "_" '{print $2}'`
do
    mkdir -p part_$aaa;
    cp -rf ./ga_work.sh part_$aaa;
    for file in `cat list_$aaa`;
    do
        mv -f $file part_$aaa;
    done
done
