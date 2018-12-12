tfile_ann=/home/juan/Desktop/juan/bio/mrcv/data/data/iwgsc/Triticum_aestivum.IWGSC.41.gff3
file_ann_gtf=/home/juan/Desktop/juan/bio/mrcv/data/data/iwgsc/Triticum_aestivum.IWGSC.41.gtf
path_aln=/home/juan/Desktop/juan/bio/mrcv/data/res/rna_deg/alignments
path_counts=/home/juan/Desktop/juan/bio/mrcv/data/res/rna_deg/counts

/home/juan/Desktop/juan/bio/sw/gfftools/gffread/gffread -E $annotation -T -o- > $annotation_gtf

htseq-count -s no $path_aln/C1.sam  $file_ann_gtf > $path_counts/C1.counts.txt
htseq-count -s no $path_aln/C2.sam  $file_ann_gtf > $path_counts/C2.counts.txt
htseq-count -s no $path_aln/C3.sam  $file_ann_gtf > $path_counts/C3.counts.txt
htseq-count -s no $path_aln/C4.sam  $file_ann_gtf > $path_counts/C4.counts.txt

htseq-count -s no $path_aln/T1.sam  $file_ann_gtf > $path_counts/T1.counts.txt
htseq-count -s no $path_aln/T2.sam  $file_ann_gtf > $path_counts/T2.counts.txt
htseq-count -s no $path_aln/T3.sam  $file_ann_gtf > $path_counts/T3.counts.txt
htseq-count -s no $path_aln/T4.sam  $file_ann_gtf > $path_counts/T4.counts.txt


