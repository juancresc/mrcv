path_tes=/home/juan/Desktop/juan/bio/mrcv/data/TEs/db
cd $path_tes
#cat families_nr.fasta repbase.triticum.fasta trep-db_nr_Rel-16.fasta > TEs.fa

#option 1
#blastn -evalue 10e-3  -query TEs.fa -db /home/juan/Desktop/juan/bio/data/IWGSC/42/blastdb/db -outfmt "6 qseqid sseqid qstart qend sstart send mismatch gaps pident evalue length qlen slen qcovs" > TEs.csv

#option 2
for filename in /home/juan/Desktop/juan/bio/data/IWGSC/42/by_chr/*.fasta
do
    basename=$(basename $filename)
    blastn -query TEs.fa -subject $filename -outfmt "6 qseqid sseqid qstart qend sstart send mismatch gaps pident evalue length qlen slen qcovs"  > ${path_tes}"/$basename.csv"
done

#option 3 separated
#nohup blastn -query /mnt/disk/mrcv/tes/repbase.triticum.fasta -db db -outfmt "6 qseqid sseqid qstart qend sstart send mismatch gaps pident evalue length qlen slen qcovs"  > /mnt/disk/mrcv/tes/repbase.blast.csv &

#nohup blastn -query /mnt/disk/mrcv/tes/trep-db_nr_Rel-16.fasta -db db -outfmt "6 qseqid sseqid qstart qend sstart send mismatch gaps pident evalue length qlen slen qcovs"  > /mnt/disk/mrcv/tes/trep.blast.csv &

#nohup blastn -evalue 10e-3 -query allmites.fasta -db db -outfmt "6 qseqid sseqid qstart qend sstart send mismatch gaps pident evalue length qlen slen qcovs"  > allmites.fasta.csv &