

for filename in /mnt/disk/iwgsc_2/by_chr/*.fasta
do
    basename=$(basename $filename)
    blastn -query /mnt/disk/mrcv/tes/trep-db_nr_Rel-16.fasta -subject /mnt/disk/iwgsc_2/by_chr/"$basename" -outfmt "6 qseqid sseqid qstart qend sstart send mismatch gaps pident evalue length qlen slen qcovs"  > /mnt/disk/mrcv/tes/trep.blast."$basename".csv
    blastn -query /mnt/disk/mrcv/tes/repbase.triticum.fasta -subject /mnt/disk/iwgsc_2/by_chr/"$basename" -outfmt "6 qseqid sseqid qstart qend sstart send mismatch gaps pident evalue length qlen slen qcovs"  > /mnt/disk/mrcv/tes/repbase.blast."$basename".csv
done


#nohup blastn -evalue 10e-3 -query allmites.fasta -db db -outfmt "6 qseqid sseqid qstart qend sstart send mismatch gaps pident evalue length qlen slen qcovs"  > allmites.fasta.csv &