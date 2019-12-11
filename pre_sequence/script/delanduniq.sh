#!/bin/bash

sed /X/d generation_all | sort -n | uniq | nl > uniq_generation;

awk -F " " '{print$2}' uniq_generation > pro_uniq
