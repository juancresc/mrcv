#variables

for file_name in SRR3690386 SRR6328740 SRR6328739 SRR1197126 SRR1197128 SRR1197127 SRR8113357 SRR1197125 SRR475422 SRR475423 SRR3710487
do 
    #../../sw/sratoolkit.2.9.6-ubuntu64/bin/fastq-dump --gzip SRR1197127
    #files
    output_dir=/home/juan/Desktop/juan/bio/mrcv/data/degradome/
    degradome=/home/juan/Desktop/juan/bio/mrcv/data/degradome/${file_name}.fastq.gz
    trimmed_degradome=/home/juan/Desktop/juan/bio/mrcv/data/degradome/${file_name}_trimmed.fq
    fasta_degradome=/home/juan/Desktop/juan/bio/mrcv/data/degradome/${file_name}_trimmed.fasta

    trimmed_degradome_gzipped_name=${file_name}_trimmed.fq.gz
    trimmed_degradome_gzipped=/home/juan/Desktop/juan/bio/mrcv/data/degradome/${file_name}_trimmed.fq.gz
    trimmed_degradome_report_name=${file_name}.fastq.gz_trimming_report.txt
    trimmed_degradome_report=/home/juan/Desktop/juan/bio/mrcv/data/degradome/${file_name}.fastq.gz_trimming_report.txt


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
    trimmomatic_path=/home/juan/Desktop/juan/bio/sw/Trimmomatic-0.38
    trim_galore_path=/home/juan/Desktop/juan/bio/sw/TrimGalore-0.6.0
    fastqc_path=/home/juan/Desktop/juan/bio/sw/FastQC

    export PATH=$PATH:$bbduk_path
    export PATH=$PATH:$fastx_path
    export PATH=$PATH:$gsta_path
    export PATH=$PATH:$samtools_path
    export PATH=$PATH:$bowtie_path
    export PATH=$PATH:$trim_galore_path
    export PATH=$PATH:$fastqc_path
    export PATH=$PATH:$trimmomatic_path

    #trimming 

    #bbduk.sh in=$degradome out=$trimmed_degradome ref=${bbduk_path}/resources/adapters.fa ktrim=r k=23 mink=11 hdist=1 tpe tbo
    #bbduk.sh in=$trimmed_degradome out=$trimmed_degradome_qual qtrim=r trimq=10

    trim_galore --dont_gzip $degradome -o $output_dir
    fastq_to_fasta -i $trimmed_degradome -o $fasta_degradome -Q33
    
    #fastq2fasta
    #fastq_to_fasta -i $trimmed_degradome_qual_unzipped -o $fasta_degradome -Q33

    #running
    ./scripts/CleaveLand4/CleaveLand4.pl -e $fasta_degradome -u $miRNAs -n $transcriptome -t -p 0.05 -o $plots > $out_deg
    rm file_1
    rm file_2
    rm file_3
done