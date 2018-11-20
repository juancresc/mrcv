#in bowtie
cd bowtie-1.2.2-linux-x86_64
export PATH=$PATH:$(pwd)
#in samtools
cd ..
cd samtools-1.9
export PATH=$PATH:$(pwd)

nohup ./ShortStack --readfile  21dpiR1C.trimmed.fq.gz 21dpiR2C.trimmed.fq.gz 21dpiR3C.trimmed.fq.gz 21dpiR1T.trimmed.fq.gz 21dpiR2T.trimmed.fq.gz  21dpiR3T.trimmed.fq.gz  --genomefile  /mnt/disk/iwgsc_refseqv1.0_all_chromosomes/161010_Chinese_Spring_v1.0_pseudomolecules.fasta  --outdir 21dpi_iwgsc_bowtie_m_all --bowtie_m all --bowtie_cores 3  &