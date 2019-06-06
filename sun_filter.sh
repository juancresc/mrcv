
cd /home/juan/Desktop/juan/bio/mrcv/data/sun

for file_name in SRR1196023 SRR1196045 SRR1196029 SRR1196022 SRR1195944 SRR1195282 SRR1195281 SRR1195280 SRR1195279 SRR1195024 SRR1195025
do 
    #unzip
    gunzip ${file_name}.fastq.gz
    #count len
    cat ${file_name}.fastq | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c
    #filter by len
    cat ${file_name}.fastq | paste - - - - | awk 'length($2)  >= 18 && length($2) <= 26' | sed 's/\t/\n/g' > ${file_name}.filtered.fastq
    #count again
    cat ${file_name}.filtered.fastq | awk '{if(NR%4==2) print length($1)}' | sort | uniq -c
    #gzip
    gzip ${file_name}.filtered.fastq
done