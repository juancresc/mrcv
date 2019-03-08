nohup blastn -query /mnt/disk/mrcv/tes/repbase.triticum.fasta -db db -outfmt "6 qseqid sseqid qstart qend sstart send mismatch gaps pident evalue length qlen slen qcovs"  > /mnt/disk/mrcv/tes/repbase.blast.csv &

nohup blastn -query /mnt/disk/mrcv/tes/trep-db_nr_Rel-16.fasta -db db -outfmt "6 qseqid sseqid qstart qend sstart send mismatch gaps pident evalue length qlen slen qcovs"  > /mnt/disk/mrcv/tes/trep.blast.csv &

nohup blastn -evalue 10e-3 -query allmites.fasta -db db -outfmt "6 qseqid sseqid qstart qend sstart send mismatch gaps pident evalue length qlen slen qcovs"  > allmites.fasta.csv &