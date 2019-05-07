1- MITEs gff
2- map small RNAs and filter bamfile to MITE gff
3- using complete annotation file (TEs, genes and promoters), which regions are regulated

https://bmcplantbiol.biomedcentral.com/articles/10.1186/s12870-018-1415-1

Library I   SRR6328739.fastq.gz
Library II  SRR6328740.fastq.gz

Note: Library I was for JN177 and library II was a mixed library composed of SR3 and SR4

For the purpose of degradome sequencing, 9 samples as described above were prepared and equal mass of root tissue from JN177 under no stress, salt stress or alkali stress were harvested and mixed to build one library, while equal mass of root tissue from the other six samples were mixed to be another library. Total RNA was extracted by TRIzol method and mRNAs with 5′-monophosphates were ligated to a 5′ adaptor, followed by reverse transcription and PCR. The construction of degradome library was according to Gao et al. [55]. Degradome sequencing was performed on a HiSeq 2000 device (BGI, Shenzhen, China). The raw sequence data of small RNA library and degradome library were respectively deposited in NCBI Sequence Read Archive (SRA, www.ncbi.nlm.nih.gov/sra) with accession number PRJNA420197 and PRJNA420207.


cd /home/juan/Desktop/juan/bio/sw/sratoolkit.2.9.6-ubuntu64/bin
export PATH=$PATH:$(pwd)
./fastq-dump --gzip

SR4A(SRR6328644)
JNA(SRR6328645)
SR3C(SRR6328646)
JNS(SRR6328648)
JNC(SRR6328647)
SR4C(SRR6328649)
SR4S(SRR6328650)
SR3S(SRR6328651)


Note: “JN” means samples of JN177. “C” in JNC, SR3C, SR4C means control condition, and “S”, “A” means saline or alkaline treatment, respectively




Raw reads from the small RNA libraries were initially edited with Fastx-toolkit pipeline (http://hannonlab.cshl.edu/fastx_toolkit/) to remove adapter sequences, low quality reads, repetitive reads and reads longer than 30 nt or shorter than 18 nt. The resulting reads were then aligned against both a wheat expressed sequence tag database (ftp.ncbi.nih.gov/repository/UniGene/Triticum_aestivum/Ta.seq.uniq.gz) and a genomic sequence database (ftp://ftpmips.helmholtz-muenchen.de/plants/wheat/IWGSC/genePrediction_v2.2/) with Bowtie. The set of perfectly matching reads was queried against the Rfam database (rfam.xfam.org/) in order to remove rRNA, tRNA, snRNA and snoRNA sequences. The residual reads were then subjected to a BLAST analysis against miRBase v21 (www.mirbase.org), and those sequences showing no mismatches were considered as “known” miRNAs. Potential novel miRNAs were identified from the remaining reads by using miREvo [15] and mirdeep2 [16] to predict miRNA precursors. Sequences mapping to a precursor forming a hairpin structure were designated as “novel” miRNAs. The abundance of miRNAs in the various libraries was normalized to transcripts per million (TPM). Differentially abundant miRNAs, were called based on a significance threshold of 0.05 (false discovery rate threshold of 0.001) and a log2 ratio threshold of 1. Only miRNAs with an abundance > 10 TPM in at least one of the libraries were used to test for differential abundance between libraries. For the degradome analysis, raw reads were initially filtered to remove adapters and low quality reads, and the remaining reads were then aligned with wheat expressed sequence to reveal sliced miRNA targets, with the help of the CleaveLand 3.0 pipeline [56]. Alignments scoring up to 5 with no mismatches at the cleavage site (nucleotides 10 and 11) were considered as potential targets. The prediction of targets was obtained by applying psRNATarget software [57] against wheat expressed sequence.

