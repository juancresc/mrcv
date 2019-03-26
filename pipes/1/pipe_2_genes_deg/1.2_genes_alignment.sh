#!/usr/bin/env bash
genome=/home/juan/Desktop/juan/bio/data/IWGSC/42/Triticum_aestivum.IWGSC.dna.toplevel.fa
index=/home/juan/Desktop/juan/bio/data/IWGSC/indexs/hisat_2/iwgsc
rna_path=/home/juan/Desktop/juan/bio/mrcv/data/RNASeq
hisat2_path=/home/juan/Desktop/juan/bio/sw/hisat2-2.1.0
res_path=/home/juan/Desktop/juan/bio/mrcv/data/RNASeq.aln
cd $hisat2_path

./hisat2 -x $index -U $rna_path/21dpi_C_R1.fq.gz -S $res_path/C1.sam --un $res_path/C1U.sam 2> $res_path/C1.log 
./hisat2 -x $index -U $rna_path/21dpi_C_R2.fq.gz -S $res_path/C2.sam --un $res_path/C2U.sam 2> $res_path/C2.log 
./hisat2 -x $index -U $rna_path/21dpi_C_R3.fq.gz -S $res_path/C3.sam --un $res_path/C3U.sam 2> $res_path/C3.log 
./hisat2 -x $index -U $rna_path/21dpi_C_R4.fq.gz -S $res_path/C4.sam --un $res_path/C4U.sam 2> $res_path/C4.log 

./hisat2 -x $index -U $rna_path/21dpi_T_R1.fq.gz -S $res_path/T1.sam --un $res_path/T1U.sam 2> $res_path/T1.log 
./hisat2 -x $index -U $rna_path/21dpi_T_R2.fq.gz -S $res_path/T2.sam --un $res_path/T2U.sam 2> $res_path/T2.log 
./hisat2 -x $index -U $rna_path/21dpi_T_R3.fq.gz -S $res_path/T3.sam --un $res_path/T3U.sam 2> $res_path/T3.log 
./hisat2 -x $index -U $rna_path/21dpi_T_R4.fq.gz -S $res_path/T4.sam --un $res_path/T4U.sam 2> $res_path/T4.log 



