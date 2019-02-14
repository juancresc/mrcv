#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import pandas as pd
from subprocess import Popen, PIPE, call
lb = 'iwgsc_4_2_19'
path_target_finder = 'sw/TargetFinder/targetfinder.pl'
target_seqs = 'data/res/iwgsc_4_2_19/genes/DEG_SEQS.fasta'


# In[ ]:


df = pd.read_csv('data/res/iwgsc_4_2_19/sRNA_DEG_mirbase.csv', sep='\t')
df.head()


# In[ ]:


#search targets
out_file = open("data/res/iwgsc_4_2_19/targets_cdna.csv","w") 
out_total = ''
for k,v in df.iterrows():
    if 'N' in v.seq:
        continue
    cmd_list = ['perl', path_target_finder,'-s',v.seq,'-q',v.Gene,'-d',target_seqs,'-p','table']
    print(' '.join(cmd_list))
    pro = Popen(cmd_list, stdout=PIPE, stderr=PIPE)
    out,err = pro.communicate()
#    out = str(out)
#    err = str(err)
    print(out,err)
    if b"No results for" in out:
        continue
    out_total += out.decode("utf-8") 
out_file.write(out_total)
out_file.close()
