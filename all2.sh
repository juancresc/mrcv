#all sRNA and loci
./sw/ShortStack/ShortStack --bamfile data/ss_mite/all_all/merged_alignments.bam  --genomefile /home/juan/Desktop/juan/bio/data/IWGSC/42/Triticum_aestivum.IWGSC.dna.toplevel.fa --bowtie_m all --foldsize 1000 --outdir data/ss_miteall/all_all

#all loci and 21nt sRNA
./sw/ShortStack/ShortStack --bamfile data/ss_mite/all_all/merged_alignments_21.bam --genomefile /home/juan/Desktop/juan/bio/data/IWGSC/42/Triticum_aestivum.IWGSC.dna.toplevel.fa --bowtie_m all --foldsize 1000 --outdir data/ss_miteall/all_21

#MITEs loci and all sRNA
./sw/ShortStack/ShortStack --bamfile data/ss_mite/all_all/merged_alignments.bam --genomefile /home/juan/Desktop/juan/bio/data/IWGSC/42/Triticum_aestivum.IWGSC.dna.toplevel.fa --bowtie_m all --foldsize 1000 --locifile /home/juan/Desktop/juan/bio/mrcv/data/genome/locifiles/mitesall.locifile.csv --outdir data/ss_miteall/mite_all

#MITEs loci and 21nt sRNA
./sw/ShortStack/ShortStack --bamfile data/ss_mite/all_all/merged_alignments_21.bam --genomefile /home/juan/Desktop/juan/bio/data/IWGSC/42/Triticum_aestivum.IWGSC.dna.toplevel.fa --bowtie_m all --foldsize 1000 --locifile /home/juan/Desktop/juan/bio/mrcv/data/genome/locifiles/mitesall.locifile.csv --outdir data/ss_miteall/mite_21
