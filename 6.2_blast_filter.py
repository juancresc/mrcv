
# coding: utf-8

# In[174]:


import pandas as pd
from itertools import cycle

te_type = 'MITE'
print('Running for', te_type)


# In[175]:


#TEs
params = {}
params['MITE'] = {'min_len':50,'max_len':800,'min_distance':5,'max_q':1.15,'min_q':0.85,'min_pident':90,'min_qcov':90,'file':'data/tes/blast_all.csv'}
#select which TE type you want to run


# In[176]:


#read blast output
df = pd.read_csv(params[te_type]['file'], sep='\t', header=None)
df.columns = ['qseqid','sseqid','qstart','qend','sstart','send','score','length','mismatch','gaps','gapopen','nident','pident','qlen','slen','qcovs']
print('initial:',len(df.index))


# In[177]:


#filter by length
if(params[te_type]['min_len']):
    df = df[df.qlen > params[te_type]['min_len']]
print('Min len: ' + str(len(df.index)))    


# In[178]:


if(params[te_type]['max_len']):
    df = df[df.qlen < params[te_type]['max_len']]
print('Max len: ' + str(len(df.index)))    


# In[179]:


#filter by query / subject length treshold
df = df[((df.length / df.qlen) >= params[te_type]['min_q'])]
print('min treshold:',len(df.index))


# In[180]:


df = df[((df.length / df.qlen) <= params[te_type]['max_q'])]
print('max treshold:',len(df.index))


# In[181]:


df = df[(df.pident >= params[te_type]['min_pident'])]
print('Min_pident: ' + str(len(df.index)))


# In[182]:


df = df[(df.qcovs >= params[te_type]['min_qcov'])]
print('Min qcov: ' + str(len(df.index)))


# In[165]:


#re-arrange start and end
df['new_sstart'] = df[['sstart','send']].min(axis=1)
df['new_ssend'] = df[['sstart','send']].max(axis=1)
df['sstart'] = df['new_sstart']
df['send'] = df['new_ssend']
df = df.drop('new_sstart',axis=1).drop('new_ssend',axis=1)


# In[166]:


df = df.sort_values(by=['sseqid','sstart'])
df.reset_index(inplace=True)
df = df.drop('index',axis=1)


# In[167]:


dfs = {}
for seq in df.sseqid.unique():
    dfs[seq] = df[df.sseqid == seq]


# In[170]:


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
        if curr_new % 10 == 0:
            print(curr_new)
    if index in discard:
        continue
    df_2 = dfs[row.sseqid]
    new_index = index + 1
    while (new_index in df_2.index) and (df_2.loc[new_index,'sstart'] - row.sstart <= params[te_type]['min_distance'] or abs(df_2.loc[new_index,'send']) - row.send <= params[te_type]['min_distance']):
        discard.append(new_index)
        new_index += 1
    rows.append(row)


# In[171]:


df = pd.DataFrame(rows)
df.sort_values(['sseqid', 'sstart'], inplace=True)
print('Non overlapped: ' + str(len(df.index)))


# In[172]:


filename = params[te_type]['file'] + '.filtered'
df.to_csv(filename, index=None, sep='\t')
filename

