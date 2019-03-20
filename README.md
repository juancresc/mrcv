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