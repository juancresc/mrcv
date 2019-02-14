awk '{ if ($3 == "gene") { print } }' Triticum_aestivum.IWGSC.42.gff3 > genes.gff3
