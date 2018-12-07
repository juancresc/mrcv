#!/usr/bin/env bash
path_hisat2=/home/juan/Desktop/juan/bio/sw/hisat2-2.1.0
cd $path_hisat2

./hisat2 -x ../../data/index/hisat_2/iwgsc -U ../../data/mrcv/genes/21dpi_C_R1.fq.gz -S ../../data/mrcv/genes/alignment/21C1.sam --un ../../data/mrcv/genes/alignment/21C1U.sam
44995555 reads; of these:
  44995555 (100.00%) were unpaired; of these:
    3185212 (7.08%) aligned 0 times
    22253243 (49.46%) aligned exactly 1 time
    19557100 (43.46%) aligned >1 times
92.92% overall alignment rate



./hisat2 -x ../../data/index/hisat_2/iwgsc -U ../../data/mrcv/genes/21dpi_C_R2.fq.gz -S ../../data/mrcv/genes/alignment/21C2.sam --un ../../data/mrcv/genes/alignment/21C2U.sam
48600135 reads; of these:
  48600135 (100.00%) were unpaired; of these:
    3155602 (6.49%) aligned 0 times
    24234678 (49.87%) aligned exactly 1 time
    21209855 (43.64%) aligned >1 times
93.51% overall alignment rate


./hisat2 -x ../../data/index/hisat_2/iwgsc -U ../../data/mrcv/genes/21dpi_C_R3.fq.gz -S ../../data/mrcv/genes/alignment/21C3.sam --un ../../data/mrcv/genes/alignment/21C3U.sam 
43126684 reads; of these:
  43126684 (100.00%) were unpaired; of these:
    3052305 (7.08%) aligned 0 times
    21583241 (50.05%) aligned exactly 1 time
    18491138 (42.88%) aligned >1 times
92.92% overall alignment rate


./hisat2 -x ../../data/index/hisat_2/iwgsc -U ../../data/mrcv/genes/21dpi_C_R4.fq.gz -S ../../data/mrcv/genes/alignment/21C4.sam --un ../../data/mrcv/genes/alignment/21C4U.sam
40540055 reads; of these:
  40540055 (100.00%) were unpaired; of these:
    2633727 (6.50%) aligned 0 times
    20381190 (50.27%) aligned exactly 1 time
    17525138 (43.23%) aligned >1 times
93.50% overall alignment rate

➜  hisat2-2.1.0 ./hisat2 -x ../../data/index/hisat_2/iwgsc -U ../../data/mrcv/genes/21dpi_T_R1.fq.gz -S ../../data/mrcv/genes/alignment/21T1.sam --un ../../data/mrcv/genes/alignment/21T1U.sam
44238652 reads; of these:
  44238652 (100.00%) were unpaired; of these:
    2577163 (5.83%) aligned 0 times
    22169889 (50.11%) aligned exactly 1 time
    19491600 (44.06%) aligned >1 times
94.17% overall alignment rate


./hisat2 -x ../../data/index/hisat_2/iwgsc -U ../../data/mrcv/genes/21dpi_T_R2.fq.gz -S ../../data/mrcv/genes/alignment/21T2.sam --un ../../data/mrcv/genes/alignment/21T2U.sam -p 2
60325626 reads; of these:
  60325626 (100.00%) were unpaired; of these:
    4588332 (7.61%) aligned 0 times
    29725784 (49.28%) aligned exactly 1 time
    26011510 (43.12%) aligned >1 times
92.39% overall alignment rate


 ./hisat2 -x ../../data/index/hisat_2/iwgsc -U ../../data/mrcv/genes/21dpi_T_R3.fq.gz -S ../../data/mrcv/genes/alignment/21T3.sam --un ../../data/mrcv/genes/alignment/21T3U.sam -p 2 
44798243 reads; of these:
  44798243 (100.00%) were unpaired; of these:
    3651149 (8.15%) aligned 0 times
    21908331 (48.90%) aligned exactly 1 time
    19238763 (42.95%) aligned >1 times
91.85% overall alignment rate


./hisat2 -x ../../data/index/hisat_2/iwgsc -U ../../data/mrcv/genes/21dpi_T_R4.fq.gz -S ../../data/mrcv/genes/alignment/21T4.sam --un ../../data/mrcv/genes/alignment/21T4U.sam -p 2 
45357968 reads; of these:
  45357968 (100.00%) were unpaired; of these:
    3021224 (6.66%) aligned 0 times
    22547821 (49.71%) aligned exactly 1 time
    19788923 (43.63%) aligned >1 times
93.34% overall alignment rate



