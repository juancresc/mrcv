
# coding: utf-8

# In[232]:


import pandas as pd
te_type = 'MITE'
print('Running for', te_type)


# In[233]:


#TEs
params = {}
params['MITE'] = {'min_len':50,'max_len':800,'min_distance':5,'max_q':1.15,'min_q':0.85,'min_pident':90,'min_qcov':90,'file':'data/tes/blast_all.csv.first'}
#select which TE type you want to run


# In[234]:


#read blast output
df = pd.read_csv(params[te_type]['file'], sep='\t', )
df.columns = ['qseqid','sseqid',
              'qstart','qend','sstart',
              'send','score','length','mismatch','gaps','gapopen','nident','pident','qlen','slen','qcovs']
print('initial:',len(df.index))


# In[235]:


#filter by length
if(params[te_type]['min_len']):
    df = df[df.qlen > params[te_type]['min_len']]
print('Min len: ' + str(len(df.index)))    


# In[236]:


if(params[te_type]['max_len']):
    df = df[df.qlen < params[te_type]['max_len']]
print('Max len: ' + str(len(df.index)))    


# In[237]:


#filter by query / subject length treshold
df = df[((df.length / df.qlen) >= params[te_type]['min_q'])]
print('min treshold:',len(df.index))


# In[238]:


df = df[((df.length / df.qlen) <= params[te_type]['max_q'])]
print('max treshold:',len(df.index))


# In[239]:


df = df[(df.pident >= params[te_type]['min_pident'])]
print('Min_pident: ' + str(len(df.index)))


# In[240]:


df = df[(df.qcovs >= params[te_type]['min_qcov'])]
print('Min qcov: ' + str(len(df.index)))


# In[241]:


#re-arrange start and end
df['new_sstart'] = df[['sstart','send']].min(axis=1)
df['new_ssend'] = df[['sstart','send']].max(axis=1)
df['sstart'] = df['new_sstart']
df['send'] = df['new_ssend']
df = df.drop('new_sstart',axis=1).drop('new_ssend',axis=1)


# In[242]:


df = df.sort_values(by=['sseqid','sstart', 'send'])
df.reset_index(inplace=True)
df = df.drop('index',axis=1)


# In[243]:


df.head()


# In[244]:


my_index = 0
indexes = []
discard = []
count = 0
curr = 0
total_len = len(df.index)
while my_index < total_len - 1:
    row = df.iloc[[my_index]]
    cond = True
    next_index = 1
    while cond:
        second_row = df.iloc[[my_index + next_index]]
        c1 = (row.iloc[0].sseqid == second_row.iloc[0].sseqid)
        c2 = (abs(second_row.iloc[0].sstart - row.iloc[0].sstart) <= params[te_type]['min_distance'])
        c3 = (abs(second_row.iloc[0].send - row.iloc[0].send) <= params[te_type]['min_distance'])
        cond =  c1 and c2 and c3
        if not cond and (c2 or c3):
            indexes.append(my_index)
            cond = True
        next_index += 1
    indexes.append(my_index)
    my_index += next_index
    #just a counter
    curr_new = int(my_index * 100 * 1.0 / (total_len * 1.0))
    if curr_new != curr:
        curr = curr_new
        if curr_new % 5 == 0:
            print(curr_new)
indexes.append(total_len - 1)


# In[245]:


df = df[df.index.isin(indexes)]
df.sort_values(['sseqid', 'sstart'], inplace=True)
print('Non overlapped: ' + str(len(df.index)))


# In[246]:


df.head()


# In[247]:


filename = params[te_type]['file'] + '.filtered'
df.to_csv(filename, index=None, sep='\t')
filename

