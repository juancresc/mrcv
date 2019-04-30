./sw/ShortStack/ShortStack --readfile /home/juan/Desktop/juan/bio/mrcv/data/sRNASeq/21dpiR1C.trimmed.fq.gz /home/juan/Desktop/juan/bio/mrcv/data/sRNASeq/21dpiR3C.trimmed.fq.gz /home/juan/Desktop/juan/bio/mrcv/data/sRNASeq/21dpiR1T.trimmed.fq.gz /home/juan/Desktop/juan/bio/mrcv/data/sRNASeq/21dpiR3T.trimmed.fq.gz --genomefile /home/juan/Desktop/juan/bio/data/IWGSC/42/Triticum_aestivum.IWGSC.dna.toplevel.fa --outdir data/ss/all_1000 --bowtie_m all --foldsize 1000

reformat.sh in=data/ss/all_1000/merged_alignments.bam out=data/ss/all_1000/merged_alignments_21.bam  minlength=21 maxlength=21

