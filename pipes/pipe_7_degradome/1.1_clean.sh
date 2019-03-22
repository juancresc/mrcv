#variables
file_name=SRR3690386
adapter=GTTGCAACTCGTATGCCGTCTTCTGCTTG

file_name=SRR3710487
adapter=CTCAATTATCGTATGCCGTCTTCTGCTTG

file_name=SRR6328740
adapter=""

file_name=SRR6328739
adapter=""

file_name=SRR1197126
adapter=""

file_name=SRR1197128
adapter=""

file_name=SRR1197127
adapter=""

file_name=SRR1197125
adapter=""

file_name=SRR8113357

#To check the adapter
#reformat.sh in=$degradome out=stdout.fa | grep -v ">" | less
#To get the file
#cd data/degradome 
#../../sw/sratoolkit.2.9.6-ubuntu64/bin/fastq-dump --gzip SRR1197127


#files
degradome=/home/juan/Desktop/juan/bio/mrcv/data/degradome/${file_name}.fastq.gz
trimmed_degradome=/home/juan/Desktop/juan/bio/mrcv/data/degradome/${file_name}.trimmed.fastq
fasta_degradome=/home/juan/Desktop/juan/bio/mrcv/data/degradome/${file_name}.trimmed.fasta

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
if [ -z "$adapter" ]
then
    bbduk.sh in=$degradome out=stdout.fq qtrim=r trimq=10 | reformat.sh in=stdin.fq out=$trimmed_degradome overwrite=true int=f
else
    bbduk.sh in=$degradome out=stdout.fq literal=$adapter ktrim=r qtrim=r trimq=10 | reformat.sh in=stdin.fq out=$trimmed_degradome overwrite=true int=f
fi


#fastq2fasta
fastq_to_fasta -i $trimmed_degradome -o $fasta_degradome -Q33

#running
./scripts/CleaveLand4/CleaveLand4.pl -e $fasta_degradome -u $miRNAs -n $transcriptome -t -o $plots > $out_deg
rm file_1
rm file_2
rm file_3