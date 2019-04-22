about ss/
GTP es alignment
GTP2 en con locifile all


773d7a2216e7e5dce0e27ee1e66d7780  Triticum_aestivum.IWGSC.dna.toplevel.fa
6388dc6ff85c9ec8c68e29422e9efab4  Triticum_aestivum.IWGSC.dna.toplevel.fa.gz


makeblastdb -in Triticum_aestivum.IWGSC.dna.toplevel.fa -dbtype nucl -out db


qseqid sseqid qstart qend sstart send mismatch gaps pident evalue length qlen slen qcovs


miRNA_name,miRNA_seq,miRNA_l2fc,target_method,target,target_l2fc,target_go_wheat,target_go_arabidopsis 


Bajamos la lista de traducción de ids
Los DAT traducido dan iguales: Si es up o down regulado en TGAC lo es en IWGSC.

Hay una sola excepcion 
Cluster_18555 con gen TraesCS2D02G175600, pero uno da en el 2B y el TGAC en el 2D, debe ser un error de la traduccion.

En las traducciones hay errores, a veces da en un homeologo. 


ata-miR169c-3p pega en sweet (interesante! es de la familia mir169 que nos habia dicho Mariana que le interesaba)

aliases:
ata-miR169c-3p, sbi-miR169d-3p, bdi-miR169h-3p

familia: MIR169_1

aca veo que tiene relacion con los SWEETs en sorgo

Sweet sorghum as biofuel feedstock: recent advances and available resources
Habla de SWEET family
https://www.ncbi.nlm.nih.gov/pubmed/28603553

https://academic.oup.com/gbe/article/5/2/402/562359

Discovery of MicroRNA169 Gene Copies in Genomes of Flowering Plants through Positional Information 


We have chosen miR169 as an example because of its possible role in stem-sugar accumulation in sorghum besides its previously described role in drought stress response in several plant species. We discovered allelic variation in miR169 expression between grain and sweet sorghum, suggesting that miR169 could also play a role in the sugar content of sorghum stems



https://bmcgenomics.biomedcentral.com/articles/10.1186/s12864-017-3556-2

https://www.ncbi.nlm.nih.gov/sra/?term=SRP076763




Raw reads were processed as previously described (Pearce et al., 2016). Briefly, “Scythe” (https://github.com/vsbuffalo/scythe) was used to remove adapter contamination (default options) and “Sickle” (https://github.com/najoshi/sickle) to remove low-quality reads (default options except –l 25 –q 25). Trimmed reads were mapped to the Chinese Spring (CS42) TGACv1 genome assembly (Clavijo et al., 2017) using GSNAPl (version 2017-09-11, default parameters except -m 2 -n 1 -N 1 -A sam) (Wu and Nacu, 2010). Raw counts for gene features were obtained using ht-seq count (default parameters except -m union -a 30) (Anders et al., 2015) using the GFF file available in Ensembl plants release 37. A threshold for mapping quality was selected so that only uniquely-mapped reads were retained, ensuring homoeologue-specific expression profiles (Pearce et al., 2015b). DESeq2 version 1.17.39 (Love et al., 2014) and R version 3.4.0 were used for the normalization and classification of differentially accumulated transcripts (DATs) between infected and mock-inoculated samples (FDR-adjusted P-value ≤ 0.05, Supplementary Table S1).



 8430  sudo mount -t ntfs /dev/sda3 disk
 8431  sudo mount -t ntfs /dev/sda3 Disk
 8432  sudo mount -t ntfs /dev/sda3 /mnt/disk

Degradomes

Spike: 
https://trace.ncbi.nlm.nih.gov/Traces/sra/?run=SRR3690386
Control

https://trace.ncbi.nlm.nih.gov/Traces/sra/?run=SRR3710487
cold stress

NO tienen adaptadores para trimear 


seedlings
https://bmcplantbiol.biomedcentral.com/articles/10.1186/s12870-018-1415-1

Grains
http://dx.plos.org/10.1371/journal.pone.0139658


Other tools
https://academic.oup.com/nar/article/46/17/8730/5051834
demo GSE113958



superior and inferior grains
https://www.nature.com/articles/s41598-018-31870-z


leaves
https://link.springer.com/article/10.1007/s00425-016-2600-9




Esa data ya estaría lista para mapear directamente, si querés hacele un QC por las dudas pero según lo que recuerdo estaba todo bastante bien. Son lecturas SE de 50pb que salieron de un HiSeq3000 del genome center de UCDavis.
 
Te copio acá lo que escribimos en el paper por si te sirve:
 
Raw reads were processed as previously described (Pearce et al., 2016). Briefly, “Scythe” (https://github.com/vsbuffalo/scythe) was used to remove adapter contamination (default options) and “Sickle” (https://github.com/najoshi/sickle) to remove low-quality reads (default options except –l 25 –q 25). Trimmed reads were mapped to the Chinese Spring (CS42) TGACv1 genome assembly (Clavijo et al., 2017) using GSNAPl (version 2017-09-11, default parameters except -m 2 -n 1 -N 1 -A sam) (Wu and Nacu, 2010). Raw counts for gene features were obtained using ht-seq count (default parameters except -m union -a 30) (Anders et al., 2015) using the GFF file available in Ensembl plants release 37. A threshold for mapping quality was selected so that only uniquely-mapped reads were retained, ensuring homoeologue-specific expression profiles (Pearce et al., 2015b). DESeq2 version 1.17.39 (Love et al., 2014) and R version 3.4.0 were used for the normalization and classification of differentially accumulated transcripts (DATs) between infected and mock-inoculated samples (FDR-adjusted P-value ≤ 0.05, Supplementary Table S1).





 
Para el experimento se muestrearon dos tiempos, 12 y 21 días post infección. Se secuenciaron 2 pooles de 3 réplicas biológicas a cada tiempo para cada tratamiento (infected y mock-inoculated), por lo que son 8 archivos fastq en total:
12dpiR1C
12dpiR1T
12dpiR3C
12dpiR3T
21dpiR1C
21dpiR1T
21dpiR3C
21dpiR3T
 
Por ejemplo, 12dpiR1C significa 12 días post infección, repetición 1, tratamiento control. Las llamamos repetición 1 y 3 porque había una segunda que no secuenciamos, pero las podemos perfectamente renombrar a repetición 1 y 2.
 
También les envío 2 archivos de texto con 2 columnas que tienen los genes diferencialmente expresados por RNAseq a 12 dpi y a 21 dpi con su respectivo fold change (en formato TGACv1). Van a notar que a 12 dpi hay solo 2 genes, por lo que evidentemente no hubieron grandes cambios (al menos de mRNAs) a ese tiempo. Por eso en el paper que estamos escribiendo nos enfocamos en el tiempo de 21 dpi. Igualmente, les diría que también analicen los sRNAs a 12 dpi, porque creo recordar que había diferencias.
 
