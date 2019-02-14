
#grep ">" data/data/tes/all.fasta | wc -l
#6693


#blastn -perc_identity 80 -task blastn -query data/data/tes/all.fasta -subject  data/data/iwgsc/Triticum_aestivum.IWGSC.dna.toplevel.fa  -outfmt '6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs' -evalue 10e-3 -qcov_hsp_perc 80 > data/res/blast_mite.csv  


blastn -perc_identity 80 -task blastn -query data/tes/all.fasta -subject /mnt/disk/iwgsc/by_chr/1A.fasta -outfmt '6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs' -evalue 10e-3 -qcov_hsp_perc 80 > blast1A.csv 

blastn -perc_identity 80 -task blastn -query data/tes/all.fasta -subject /mnt/disk/iwgsc/by_chr/1B.fasta -outfmt '6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs' -evalue 10e-3 -qcov_hsp_perc 80 > blast1B.csv 

blastn -perc_identity 80 -task blastn -query data/tes/all.fasta -subject /mnt/disk/iwgsc/by_chr/1D.fasta -outfmt '6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs' -evalue 10e-3 -qcov_hsp_perc 80 > blast1D.csv 

blastn -perc_identity 80 -task blastn -query data/tes/all.fasta -subject /mnt/disk/iwgsc/by_chr/2A.fasta -outfmt '6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs' -evalue 10e-3 -qcov_hsp_perc 80 > blast2A.csv 

blastn -perc_identity 80 -task blastn -query data/tes/all.fasta -subject /mnt/disk/iwgsc/by_chr/2B.fasta -outfmt '6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs' -evalue 10e-3 -qcov_hsp_perc 80 > blast2B.csv 


blastn -perc_identity 80 -task blastn -query data/tes/all.fasta -subject /mnt/disk/iwgsc/by_chr/2D.fasta -outfmt '6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs' -evalue 10e-3 -qcov_hsp_perc 80 > blast2D.csv 

blastn -perc_identity 80 -task blastn -query data/tes/all.fasta -subject /mnt/disk/iwgsc/by_chr/3A.fasta -outfmt '6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs' -evalue 10e-3 -qcov_hsp_perc 80 > blast3A.csv 

blastn -perc_identity 80 -task blastn -query data/tes/all.fasta -subject /mnt/disk/iwgsc/by_chr/3B.fasta -outfmt '6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs' -evalue 10e-3 -qcov_hsp_perc 80 > blast3B.csv 


blastn -perc_identity 80 -task blastn -query data/tes/all.fasta -subject /mnt/disk/iwgsc/by_chr/3D.fasta -outfmt '6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs' -evalue 10e-3 -qcov_hsp_perc 80 > blast3D.csv 

blastn -perc_identity 80 -task blastn -query data/tes/all.fasta -subject /mnt/disk/iwgsc/by_chr/4A.fasta -outfmt '6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs' -evalue 10e-3 -qcov_hsp_perc 80 > blast4A.csv 

blastn -perc_identity 80 -task blastn -query data/tes/all.fasta -subject /mnt/disk/iwgsc/by_chr/4B.fasta -outfmt '6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs' -evalue 10e-3 -qcov_hsp_perc 80 > blast4B.csv 

blastn -perc_identity 80 -task blastn -query data/tes/all.fasta -subject /mnt/disk/iwgsc/by_chr/4D.fasta -outfmt '6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs' -evalue 10e-3 -qcov_hsp_perc 80 > blast4D.csv 

blastn -perc_identity 80 -task blastn -query data/tes/all.fasta -subject /mnt/disk/iwgsc/by_chr/5A.fasta -outfmt '6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs' -evalue 10e-3 -qcov_hsp_perc 80 > blast5A.csv 

blastn -perc_identity 80 -task blastn -query data/tes/all.fasta -subject /mnt/disk/iwgsc/by_chr/5B.fasta -outfmt '6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs' -evalue 10e-3 -qcov_hsp_perc 80 > blast5B.csv 

blastn -perc_identity 80 -task blastn -query data/tes/all.fasta -subject /mnt/disk/iwgsc/by_chr/5D.fasta -outfmt '6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs' -evalue 10e-3 -qcov_hsp_perc 80 > blast5D.csv 

blastn -perc_identity 80 -task blastn -query data/tes/all.fasta -subject /mnt/disk/iwgsc/by_chr/6A.fasta -outfmt '6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs' -evalue 10e-3 -qcov_hsp_perc 80 > blast6A.csv 

blastn -perc_identity 80 -task blastn -query data/tes/all.fasta -subject /mnt/disk/iwgsc/by_chr/6B.fasta -outfmt '6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs' -evalue 10e-3 -qcov_hsp_perc 80 > blast6B.csv 

blastn -perc_identity 80 -task blastn -query data/tes/all.fasta -subject /mnt/disk/iwgsc/by_chr/6D.fasta -outfmt '6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs' -evalue 10e-3 -qcov_hsp_perc 80 > blast6D.csv 


blastn -perc_identity 80 -task blastn -query data/tes/all.fasta -subject /mnt/disk/iwgsc/by_chr/7A.fasta -outfmt '6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs' -evalue 10e-3 -qcov_hsp_perc 80 > blast7A.csv 

blastn -perc_identity 80 -task blastn -query data/tes/all.fasta -subject /mnt/disk/iwgsc/by_chr/7B.fasta -outfmt '6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs' -evalue 10e-3 -qcov_hsp_perc 80 > blast7B.csv 

blastn -perc_identity 80 -task blastn -query data/tes/all.fasta -subject /mnt/disk/iwgsc/by_chr/7D.fasta -outfmt '6 qseqid sseqid qstart qend sstart send score length mismatch gaps gapopen nident pident qlen slen qcovs' -evalue 10e-3 -qcov_hsp_perc 80 > blast47D.csv 