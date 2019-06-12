#!/usr/bin/env bash
genome=/home/juan/Desktop/juan/bio/data/IWGSC/42/Triticum_aestivum.IWGSC.dna.toplevel.fa
index=/home/juan/Desktop/juan/bio/data/IWGSC/indexs/hisat_2/iwgsc
hisat2_path=/home/juan/Desktop/juan/bio/sw/hisat2-2.1.0
cd $hisat2_path
./hisat2-build $genome $index