#variables

for file_name in SRR3690386 SRR6328740 SRR6328739 SRR1197126 SRR1197128 SRR1197127 SRR8113357 SRR1197125 SRR475422 SRR475423 SRR3710487
do 
    #../../sw/sratoolkit.2.9.6-ubuntu64/bin/fastq-dump --gzip SRR1197127
    #files
    degradome=/home/juan/Desktop/juan/bio/mrcv/data/degradome/${file_name}.fastq.gz
    trimmed_degradome_gzipped=/home/juan/Desktop/juan/bio/mrcv/data/degradome/${file_name}_trimmed.fq.gz
    qual_trimmed_degradome_gzipped=/home/juan/Desktop/juan/bio/mrcv/data/degradome/${file_name}_trimmed_qual.fq.gz
    
    trimmed_degradome_gzipped_name=${file_name}_trimmed.fq.gz
    trimmed_degradome_report=/home/juan/Desktop/juan/bio/mrcv/data/degradome/${file_name}.fq.gz_trimming_report.txt
    trimmed_degradome_report_name=${file_name}.fastq.gz_trimming_report.txt
    trimmed_degradome=/home/juan/Desktop/juan/bio/mrcv/data/degradome/${file_name}_trimmed.fq
    fasta_degradome=/home/juan/Desktop/juan/bio/mrcv/data/degradome/${file_name}_trimmed.fasta

    transcriptome=/home/juan/Desktop/juan/bio/mrcv/data/res/04_02_19/DEG-cdna.fasta
    miRNAs=/home/juan/Desktop/juan/bio/mrcv/data/res/04_02_19/miRNA.Y.DEG.fasta

    mkdir -p /home/juan/Desktop/juan/bio/mrcv/data/res/04_02_19/cleaveland/${file_name}
    out_deg=/home/juan/Desktop/juan/bio/mrcv/data/res/04_02_19/cleaveland/${file_name}/cleaves.csv
    rm -fr /home/juan/Desktop/juan/bio/mrcv/data/res/04_02_19/cleaveland/${file_name}/plots
    plots=/home/juan/Desktop/juan/bio/mrcv/data/res/04_02_19/cleaveland/${file_name}/plots

    #programs
    fastx_path=/home/juan/Desktop/juan/bio/sw/fastx_toolkit_0.0.13_binaries_Linux_2.6_amd64/bin
    bbduk_path=/home/juan/Desktop/juan/bio/sw/BBMap_38.42/bbmap
    gsta_path=/home/juan/Desktop/juan/bio/mrcv/scripts/CleaveLand4/GSTAr_v1-0
    samtools_path=/home/juan/Desktop/juan/bio/sw/samtools-1.9
    bowtie_path=/home/juan/Desktop/juan/bio/sw/bowtie-1.2.2-linux-x86_64
    export PATH=$PATH:$bbduk_path
    export PATH=$PATH:$fastx_path
    export PATH=$PATH:$gsta_path
    export PATH=$PATH:$samtools_path
    export PATH=$PATH:$bowtie_path

    trim_galore_path=/home/juan/Desktop/juan/bio/sw/TrimGalore-0.6.0
    fastqc_path=/home/juan/Desktop/juan/bio/sw/FastQC
    export PATH=$PATH:$trim_galore_path
    export PATH=$PATH:$fastqc_path

    #trimming 

    bbduk.sh in=$degradome out=$trimmed_degradome_gzipped ref=${$bbduk_path}/resources/adapters.fa ktrim=r k=23 mink=11 hdist=1 tpe tbo
    bbduk.sh in=reads.fq out=clean.fq qtrim=r trimq=10




    #trim_galore --small_rna $degradome
    # --length 17
    # 
    #mv $trimmed_degradome_gzipped_name $trimmed_degradome_gzipped
    #mv $trimmed_degradome_report_name $trimmed_degradome_report
    #gunzip $trimmed_degradome_gzipped $trimmed_degradome

    #fastq2fasta
    fastq_to_fasta -i $trimmed_degradome -o $fasta_degradome -Q33

    #running
    ./scripts/CleaveLand4/CleaveLand4.pl -e $fasta_degradome -u $miRNAs -n $transcriptome -t -p 0.05 -o $plots > $out_deg
    rm file_1
    rm file_2
    rm file_3
done