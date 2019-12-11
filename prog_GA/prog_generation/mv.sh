#!/bin/bash

for aaa in `ls list_*|awk -F "_" '{print $2}'`
do
    
    for file in `cat list_$aaa`;
    do
        mv -f part_$aaa/$file .;
    done
done

