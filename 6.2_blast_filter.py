
# coding: utf-8

# In[174]:


import pandas as pd
import dask.dataframe as dd
from dask.multiprocessing import get

te_type = 'MITE'
print('Running for', te_type)


# In[175]:


#TEs
params = {}
params['MITE'] = {'min_len':50,'max_len':800,'min_distance':5,'max_q':1.15,'min_q':0.85,'min_pident':90,'min_qcov':90,'file':'data/tes/blast_all.head.1.csv'}
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


# In[183]:


#re-arrange start and end
df['new_sstart'] = df[['sstart','send']].min(axis=1)
df['new_ssend'] = df[['sstart','send']].max(axis=1)
df['sstart'] = df['new_sstart']
df['send'] = df['new_ssend']
df = df.drop('new_sstart',axis=1).drop('new_ssend',axis=1)


# In[184]:


df = df.sort_values(by=['sseqid','sstart'])
df.reset_index(inplace=True)
df = df.drop('index',axis=1)


# In[185]:


df


# In[186]:


my_index = 0
indexes = []
discard = []
count = 0
curr = 0
total_len = len(df.index)
while my_index < total_len - 1:
    row = df.iloc[[my_index]]
    second_row = df.iloc[[my_index + 1]]
    seq1 = row.sseqid
    cond = (row.iloc[0].sseqid == second_row.iloc[0].sseqid) & (abs(second_row.iloc[0].sstart - row.iloc[0].sstart) <= params[te_type]['min_distance']) & (abs(second_row.iloc[0].send - row.iloc[0].send) <= params[te_type]['min_distance'])
    if not cond:
        indexes.append(my_index)
    my_index += 1
    #just a counter
    count += 1
    curr_new = int(count * 100 * 1.0 / (total_len * 1.0))
    if curr_new != curr:
        curr = curr_new
        if curr_new % 5 == 0:
            print(curr_new)
indexes.append(total_len - 1)


# In[187]:


df = df[df.index.isin(indexes)]
df.sort_values(['sseqid', 'sstart'], inplace=True)
print('Non overlapped: ' + str(len(df.index)))


# In[188]:


filename = params[te_type]['file'] + '.2.filtered'
df.to_csv(filename, index=None, sep='\t')
filename

