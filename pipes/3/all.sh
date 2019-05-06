#all sRNA and loci
./sw/ShortStack/ShortStack --readfile /home/juan/Desktop/juan/bio/mrcv/data/sRNASeq/21dpiR1C.trimmed.fq.gz /home/juan/Desktop/juan/bio/mrcv/data/sRNASeq/21dpiR3C.trimmed.fq.gz /home/juan/Desktop/juan/bio/mrcv/data/sRNASeq/21dpiR1T.trimmed.fq.gz /home/juan/Desktop/juan/bio/mrcv/data/sRNASeq/21dpiR3T.trimmed.fq.gz --genomefile /home/juan/Desktop/juan/bio/data/IWGSC/42/Triticum_aestivum.IWGSC.dna.toplevel.fa --outdir data/ss_mite/all_all --bowtie_m all --foldsize 1000 --bowtie_cores 3

#filter bamfile to 21nt
reformat.sh in=data/ss_mite/all_all/merged_alignments.bam out=data/ss_mite/all_all/merged_alignments_21.bam  minlength=21 maxlength=21

#all loci and 21nt sRNA
./sw/ShortStack/ShortStack --bamfile data/ss_mite/all_all/merged_alignments_21.bam --genomefile /home/juan/Desktop/juan/bio/data/IWGSC/42/Triticum_aestivum.IWGSC.dna.toplevel.fa --outdir data/ss_mite/all_21nt --bowtie_m all --foldsize 1000 --bowtie_cores 3

#MITEs loci and all sRNA
./sw/ShortStack/ShortStack --bamfile data/ss_mite/all_all/merged_alignments.bam --genomefile /home/juan/Desktop/juan/bio/data/IWGSC/42/Triticum_aestivum.IWGSC.dna.toplevel.fa --outdir data/ss_mite/mite_all --bowtie_m all --foldsize 1000 --locifile /home/juan/Desktop/juan/bio/mrcv/data/genome/locifiles/mites.locifile.csv --bowtie_cores 3

#MITEs loci and 21nt sRNA
./sw/ShortStack/ShortStack --bamfile data/ss_mite/all_all/merged_alignments_21.bam --genomefile /home/juan/Desktop/juan/bio/data/IWGSC/42/Triticum_aestivum.IWGSC.dna.toplevel.fa --outdir data/ss_mite/mite_21 --bowtie_m all --foldsize 1000 --locifile /home/juan/Desktop/juan/bio/mrcv/data/genome/locifiles/mites.locifile.csv --bowtie_cores 3
