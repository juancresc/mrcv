#!/usr/bin/env python
# coding: utf-8

# In[18]:


import pandas as pd
chromosomes = ['1A','1B','1D','2A','2B','2D','3A','3B','3D','4A','4B','4D','5A','5B','5D','6A','6B','6D','7A','7B','7D','Un']
for chromosome in chromosomes:
    path_blast = 'data/TEs/blast/mites/' + chromosome + '.fasta.mites.csv'
    print('working on ', path_blast)
    path_blast_filtered = 'data/TEs/blast/mites_filtered/' + chromosome + '.filtered.csv'
    #TEs
    params = {'min_len':50,'max_len':False,'min_distance':5,'max_q':1.3,'min_q':0.7,'min_pident':80,'min_qcov':50}

    #read blast output
    df = pd.read_csv(path_blast, sep='\t', header=None)
    df.columns = ['qseqid','sseqid','qstart','qend','sstart','send','mismatch','gaps','pident','evalue','length','qlen','slen','qcovs']
    print('initial:',len(df.index))
    initial = len(df.index)

    #filter by length
    if(params['min_len']):
        df = df[df.qlen > params['min_len']]
    print('Min len: ' + str(len(df.index)))
    min_length = str(len(df.index))

    if(params['max_len']):
        df = df[df.qlen < params['max_len']]
    print('Max len: ' + str(len(df.index)))    
    max_length = str(len(df.index))

    #filter by query / subject length treshold
    df = df[((df.length / df.qlen) >= params['min_q'])]
    print('min treshold:',len(df.index))
    min_treshold = str(len(df.index))

    df = df[((df.length / df.qlen) <= params['max_q'])]
    print('max treshold:',len(df.index))
    max_treshold = str(len(df.index))

    #filter by pident
    df = df[(df.pident >= params['min_pident'])]
    print('Min_pident: ' + str(len(df.index)))
    min_pident = str(len(df.index))

    #filter by qcov
    df = df[(df.qcovs >= params['min_qcov'])]
    print('Min qcov: ' + str(len(df.index)))
    min_qcov = str(len(df.index))

    #order sstart and send
    df['new_sstart'] = df[['sstart','send']].min(axis=1)
    df['new_ssend'] = df[['sstart','send']].max(axis=1)
    df['sstart'] = df['new_sstart']
    df['send'] = df['new_ssend']
    df = df.drop('new_sstart',axis=1).drop('new_ssend',axis=1)

    # sep by chr
    dfs = {}
    for seq in df.sseqid.unique():
        dfs[seq] = df[df.sseqid == seq]

    # filter overlapped 
    rows = []
    discard = []
    total = len(df.index)
    count = 0
    curr = 0
    for index, row in df.iterrows():
        count += 1
        curr_new = int(count * 100 * 1.0 / (total * 1.0))
        if curr_new != curr:
            curr = curr_new
            if curr_new % 5 == 0:
                print(curr_new)
        if index in discard:
            continue
        df_2 = dfs[row.sseqid]
        res = df_2[(abs(df_2.sstart - row.sstart) <= params['min_distance']) | (abs(df_2.send - row.send) <= params['min_distance'])]
        if len(res.index) > 1:
            discard.extend(res.index.values)
        rows.append(row)

    df = pd.DataFrame(rows)
    df.sort_values(['sseqid', 'sstart'], inplace=True)
    print('Non overlapped: ' + str(len(df.index)))
    non_overlapped = str(len(df.index))


    df.to_csv(path_blast_filtered, index=None, sep='\t')

    print('Initial: ' + str(initial))
    print('Min len: ' + str(min_length))
    print('Max len: ' + str(max_length))
    print('Min treshold: ' + str(min_treshold))
    print('Max treshold: ' + str(max_treshold))
    print('Min pident: ' + str(min_pident))
    print('Min qcov: ' + str(min_qcov))
    print('Non overlapped: ' + str(non_overlapped))
    print('Saved: ' + path_blast_filtered)
