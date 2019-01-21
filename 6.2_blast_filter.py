import pandas as pd
from itertools import cycle

te_type = 'MITE'
print('Running for', te_type)

#TEs
params = {}
params['MITE'] = {'min_len':50,'max_len':800,'min_distance':5,'max_q':1.15,'min_q':0.85,'min_pident':90,'min_qcov':90,'file':'data/tes/blast_all.csv'}
#select which TE type you want to run

#read blast output
df = pd.read_csv(params[te_type]['file'], sep='\t', header=None)
df.columns = ['qseqid','sseqid','qstart','qend','sstart','send','score','length','mismatch','gaps','gapopen','nident','pident','qlen','slen','qcovs']
print('initial:',len(df.index))

# In[40]:


#filter by length
if(params[te_type]['min_len']):
    df = df[df.qlen > params[te_type]['min_len']]
print('Min len: ' + str(len(df.index)))    


# In[41]:


if(params[te_type]['max_len']):
    df = df[df.qlen < params[te_type]['max_len']]
print('Max len: ' + str(len(df.index)))    


# In[42]:


#filter by query / subject length treshold
df = df[((df.length / df.qlen) >= params[te_type]['min_q'])]
print('min treshold:',len(df.index))


# In[43]:


df = df[((df.length / df.qlen) <= params[te_type]['max_q'])]
print('max treshold:',len(df.index))


# In[44]:


#filter by pident
df = df[(df.pident >= params[te_type]['min_pident'])]
print('Min_pident: ' + str(len(df.index)))


# In[45]:


#filter by qcov
df = df[(df.qcovs >= params[te_type]['min_qcov'])]
print('Min qcov: ' + str(len(df.index)))


# In[46]:


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


# In[ ]:


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
    res = df_2[(abs(df_2.sstart - row.sstart) <= params[te_type]['min_distance']) | (abs(df_2.send - row.send) <= params[te_type]['min_distance'])]
    if len(res.index) > 1:
        discard.extend(res.index.values)
    rows.append(row)


# In[ ]:


df = pd.DataFrame(rows)
df.sort_values(['sseqid', 'sstart'], inplace=True)
print('Non overlapped: ' + str(len(df.index)))


# In[ ]:


filename = path_blast + params[te_type]['file'] + '.filtered'
df.to_csv(filename, index=None, sep='\t')
filename

