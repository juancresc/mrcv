#blast2gff
python scripts/blast2gff.py -i data/tes/blast_all.csv.2.filtered -o data/tes/mites.gff -n MITE_tracker
#gff2bed
python scripts/gff2bed.py -a mrcv/data/tes/mites.gff -o mrcv/data/tes/mites.bed

#alignments
gzip -d -c /mnt/disk/mrcv/sRNASeq/21dpiR1C.trimmed.fq.gz | bowtie -q -v 0 -p 1 -S -a -m 50 --large-index --sam-RG ID:21dpiR1C.trimmed /mnt/disk/iwgsc/Triticum_aestivum.IWGSC.dna.toplevel > iwgsc_mites/21dpiR1C.trimmed_readsorted.sam.gz

gzip -d -c /mnt/disk/mrcv/sRNASeq/21dpiR3C.trimmed.fq.gz | bowtie -q -v 0 -p 1 -S -a -m 50 --large-index --sam-RG ID:21dpiR3C.trimmed /mnt/disk/iwgsc/Triticum_aestivum.IWGSC.dna.toplevel > iwgsc_mites/21dpiR3C.trimmed_readsorted.sam.gz

gzip -d -c /mnt/disk/mrcv/sRNASeq/21dpiR3T.trimmed.fq.gz | bowtie -q -v 0 -p 1 -S -a -m 50 --large-index --sam-RG ID:21dpiR3T.trimmed /mnt/disk/iwgsc/Triticum_aestivum.IWGSC.dna.toplevel > iwgsc_mites/21dpiR3T.trimmed_readsorted.sam.gz


gzip -d -c /mnt/disk/mrcv/sRNASeq/21dpiR1T.trimmed.fq.gz | bowtie -q -v 0 -p 1 -S -a -m 50 --large-index --sam-RG ID:21dpiR1T.trimmed /mnt/disk/iwgsc/Triticum_aestivum.IWGSC.dna.toplevel > iwgsc_mites/21dpiR1T.trimmed_readsorted.sam.gz

#merge all alignments
samtools merge iwgsc_mites/merged_alignments.bam iwgsc_mites/21dpiR1C.trimmed.bam iwgsc_mites/21dpiR3C.trimmed.bam iwgsc_mites/21dpiR1T.trimmed.bam iwgsc_mites/21dpiR3T.trimmed.bam

#filter by mites position
samtools view -b -L  data/tes/mites.bed ../ShortStack/iwgsc_mites/merged_alignments.bam > ../ShortStack/iwgsc_mites/merged_alignments.filtered.bam

#convert to sam
samtools view -h -o merged_alignments.sam merged_alignments.filtered.bam
