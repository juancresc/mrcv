
nohup ./bowtie -a -v 0 /mnt/disk/mrcv/mrcv_genome/S1NC_008733consensus  -q /mnt/disk/mrcv/sRNASeq/21dpiR1T.trimmed.fq.gz --sam > /mnt/disk/mrcv/ShortStack/virus_bowtie_S1/T1.sam 2> /mnt/disk/mrcv/ShortStack/virus_bowtie_S1/T1.log &

nohup ./bowtie -a -v 0 /mnt/disk/mrcv/mrcv_genome/S1NC_008733consensus  -q /mnt/disk/mrcv/sRNASeq/21dpiR3T.trimmed.fq.gz --sam > /mnt/disk/mrcv/ShortStack/virus_bowtie_S1/T3.sam 2> /mnt/disk/mrcv/ShortStack/virus_bowtie_S1/T3.log &

nohup ./bowtie -a -v 0 /mnt/disk/mrcv/mrcv_genome/S1NC_008733consensus  -q /mnt/disk/mrcv/sRNASeq/21dpiR1C.trimmed.fq.gz --sam > /mnt/disk/mrcv/ShortStack/virus_bowtie_S1/C1.sam 2> /mnt/disk/mrcv/ShortStack/virus_bowtie_S1/C1.log &

nohup ./bowtie -a -v 0 /mnt/disk/mrcv/mrcv_genome/S1NC_008733consensus  -q /mnt/disk/mrcv/sRNASeq/21dpiR3C.trimmed.fq.gz --sam > /mnt/disk/mrcv/ShortStack/virus_bowtie_S1/C3.sam 2> /mnt/disk/mrcv/ShortStack/virus_bowtie_S1/C3.log &

#optional for bowtie1 which has no unnal option
 samtools view -h -S -F4 /mnt/disk/mrcv/ShortStack/virus_bowtie_S1/T1.sam > /mnt/disk/mrcv/ShortStack/virus_bowtie_S1/T1.mapped.sam
 samtools view -h -S -F4 /mnt/disk/mrcv/ShortStack/virus_bowtie_S1/T3.sam > /mnt/disk/mrcv/ShortStack/virus_bowtie_S1/T3.mapped.sam
 samtools view -h -S -F4 /mnt/disk/mrcv/ShortStack/virus_bowtie_S1/C1.sam > /mnt/disk/mrcv/ShortStack/virus_bowtie_S1/C1.mapped.sam
 samtools view -h -S -F4 /mnt/disk/mrcv/ShortStack/virus_bowtie_S1/C3.sam > /mnt/disk/mrcv/ShortStack/virus_bowtie_S1/C3.mapped.sam

samtools view -Sb C3.mapped.sam > C3.mapped.bam
samtools sort C3.mapped.bam > C3.mapped.sorted.bam
samtools index C3.mapped.sorted.bam
samtools mpileup C3.mapped.sorted.bam | awk -v X="1" '$4>=X' | wc -l
/mnt/disk/mrcv/ShortStack/bowtie-1.2.2-linux-x86_64/bowtie-inspect -s /mnt/disk/mrcv/mrcv_genome/S1NC_008733consensus | awk '{ FS = "\t" } ; BEGIN{L=0}; {L=L+$3}; END{print L}'
4501

C1: 994 => 20%
reads with at least one reported alignment: 61 (0.00%)

C3: 832 => 18%
reads with at least one reported alignment: 49 (0.00%)

T1: 4501 => 100%
# reads with at least one reported alignment: 233277 (0.56%)

T3: 4501 => 100%
# reads with at least one reported alignment: 142137 (0.45%)

nohup ./ShortStack --readfile /mnt/disk/mrcv/sRNASeq/21dpiR1C.trimmed.fq.gz /mnt/disk/mrcv/sRNASeq/21dpiR3C.trimmed.fq.gz /mnt/disk/mrcv/sRNASeq/21dpiR1T.trimmed.fq.gz /mnt/disk/mrcv/sRNASeq/21dpiR3T.trimmed.fq.gz --genomefile /mnt/disk/mrcv/mrcv_genome/S1NC_008733consensus.fa  --outdir 21dpi_mrcv_S1  &







