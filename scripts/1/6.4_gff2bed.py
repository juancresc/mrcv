#!/usr/bin/env python
# -*- coding: utf-8 -*-
import pandas as pd
from Bio import SeqIO
from Bio.SeqRecord import SeqRecord
from Bio.Seq import Seq

def gff2Fbed(annotation, output):
    """Extract fasta files from annotations
    """
    df_gff = pd.read_csv(annotation, index_col=False, sep='\t', header=None)
    df_gff.columns = ['seqname', 'source', 'feature', 'start', 'end', 'score', 'strand', 'frame', 'attribute']
    df_gff['chrom'] = df_gff['seqname']
    df_gff['chromStart'] = df_gff['start'] - 1 
    df_gff['chromEnd'] = df_gff['end'] - 1 
    df_bed = df_gff[['chrom','chromStart','chromEnd']]
    df_bed.to_csv(output,sep='\t', encoding='utf-8',index=False,header=False)

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()#pylint: disable=invalid-name
    parser.add_argument("-a", "--annotation", help="Annotation file (.gff3 format)", required=True)
    parser.add_argument("-o", "--output", help="Output file name (.fasta format)")
    args = parser.parse_args()#pylint: disable=invalid-name
    gff2Fbed(args.annotation, args.output)
