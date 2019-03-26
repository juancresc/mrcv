cd /home/juan/Desktop/juan/bio/mrcv/data/TEs/db
cat families_nr.fasta repbase.triticum.fasta trep-db_nr_Rel-16.fasta > TEs.fa
blastn -evalue 10e-3  -query TEs.fa -db /home/juan/Desktop/juan/bio/data/IWGSC/42/blastdb/db -outfmt "6 qseqid sseqid qstart qend sstart send mismatch gaps pident evalue length qlen slen qcovs" > TEs.csv