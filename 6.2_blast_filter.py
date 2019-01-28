#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import pandas as pd

te_type = 'MITE'
print('Running for', te_type)


# In[ ]:


#TEs
params = {}
params['MITE'] = {'min_len':50,'max_len':800,'min_distance':5,'max_q':1.15,'min_q':0.85,'min_pident':90,'min_qcov':90,'file':'data/tes/blast_all.csv'}
#select which TE type you want to run


# In[ ]:


#read blast output
df = pd.read_csv(params[te_type]['file'], sep='\t', header=None)
df.columns = ['qseqid','sseqid','qstart','qend','sstart','send','score','length','mismatch','gaps','gapopen','nident','pident','qlen','slen','qcovs']
print('initial:',len(df.index))


# In[ ]:


#filter by length
if(params[te_type]['min_len']):
    df = df[df.qlen > params[te_type]['min_len']]
print('Min len: ' + str(len(df.index)))    


# In[ ]:


if(params[te_type]['max_len']):
    df = df[df.qlen < params[te_type]['max_len']]
print('Max len: ' + str(len(df.index)))    


# In[ ]:


#filter by query / subject length treshold
df = df[((df.length / df.qlen) >= params[te_type]['min_q'])]
print('min treshold:',len(df.index))


# In[ ]:


df = df[((df.length / df.qlen) <= params[te_type]['max_q'])]
print('max treshold:',len(df.index))


# In[ ]:


df = df[(df.pident >= params[te_type]['min_pident'])]
print('Min_pident: ' + str(len(df.index)))


# In[ ]:


df = df[(df.qcovs >= params[te_type]['min_qcov'])]
print('Min qcov: ' + str(len(df.index)))


# In[ ]:


#re-arrange start and end
df['new_sstart'] = df[['sstart','send']].min(axis=1)
df['new_ssend'] = df[['sstart','send']].max(axis=1)
df['sstart'] = df['new_sstart']
df['send'] = df['new_ssend']
df = df.drop('new_sstart',axis=1).drop('new_ssend',axis=1)


# In[ ]:


df = df.sort_values(by=['sseqid','sstart'])
df.reset_index(inplace=True)
df = df.drop('index',axis=1)


# In[ ]:





# In[ ]:


dfs = {}
chrs = df.sseqid.unique()
count = 0
for seq in chrs:
    df_2 = df[df.sseqid == seq]
    rows = []
    discard = []
    total = len(df_2.index)
    curr = 0
    for index, row in df_2.iterrows():
        count += 1
        curr_new = int(count * 100 * 1.0 / (total * 1.0))
        if curr_new != curr:
            curr = curr_new
            if curr_new % 1 == 0:
                print(curr_new)
        if index in discard:
            continue
        res = df_2[(abs(df_2.sstart - row.sstart) <= params[te_type]['min_distance']) | (abs(df_2.send - row.send) <= params[te_type]['min_distance'])]
        if len(res.index) > 1:
            discard.extend(res.index.values)
        rows.append(row)


# In[ ]:


df = pd.DataFrame(rows)
df.sort_values(['sseqid', 'sstart'], inplace=True)
print('Non overlapped: ' + str(len(df.index)))


# In[ ]:


filename = params[te_type]['file'] + '.new.filtered'
df.to_csv(filename, index=None, sep='\t')
filename


