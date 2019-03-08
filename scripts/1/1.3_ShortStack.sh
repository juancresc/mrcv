cd /mnt/disk/mrcv/ShortStack 

#in bowtie
cd bowtie-1.2.2-linux-x86_64
export PATH=$PATH:$(pwd)
#in samtools
cd ..
cd samtools-1.9
export PATH=$PATH:$(pwd)

cd ..
#all
nohup ./ShortStack --readfile  /mnt/disk/mrcv/sRNASeq/21dpiR1C.trimmed.fq.gz /mnt/disk/mrcv/sRNASeq/21dpiR3C.trimmed.fq.gz /mnt/disk/mrcv/sRNASeq/21dpiR1T.trimmed.fq.gz /mnt/disk/mrcv/sRNASeq/21dpiR3T.trimmed.fq.gz  --genomefile  /mnt/disk/iwgsc/Triticum_aestivum.IWGSC.dna.toplevel.fa  --outdir 21dpi_iwgsc_bowtie_m_all_2 --bowtie_m all &

#T
nohup ./ShortStack --readfile /mnt/disk/mrcv/sRNASeq/21dpiR1T.trimmed.fq.gz /mnt/disk/mrcv/sRNASeq/21dpiR3T.trimmed.fq.gz --genomefile /mnt/disk/iwgsc/Triticum_aestivum.IWGSC.dna.toplevel.fa  --outdir 21dpi_iwgsc_bowtie_m_all_2_T --bowtie_m all &

#C
nohup ./ShortStack --readfile /mnt/disk/mrcv/sRNASeq/21dpiR1C.trimmed.fq.gz /mnt/disk/mrcv/sRNASeq/21dpiR3C.trimmed.fq.gz --genomefile /mnt/disk/iwgsc/Triticum_aestivum.IWGSC.dna.toplevel.fa  --outdir 21dpi_iwgsc_bowtie_m_all_2_C --bowtie_m all &



./sw/ShortStack/ShortStack --readfile /home/juan/Desktop/juan/bio/mrcv/data/sRNASeq/21dpiR1C.trimmed.fq.gz /home/juan/Desktop/juan/bio/mrcv/data/sRNASeq/21dpiR3C.trimmed.fq.gz /home/juan/Desktop/juan/bio/mrcv/data/sRNASeq/21dpiR1T.trimmed.fq.gz /home/juan/Desktop/juan/bio/mrcv/data/sRNASeq/21dpiR3T.trimmed.fq.gz --genomefile /home/juan/Desktop/juan/biotrash/IWGSC/161010_Chinese_Spring_v1.0_pseudomolecules.fasta  --outdir data/ss/25_02_19 --bowtie_m all
