blastn -task blastn -query sRNA_DEG.fasta   -subject ../../libs/mature.fa -outfmt "6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs" > degs_mirbase.blast.csv