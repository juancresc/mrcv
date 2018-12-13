#!/usr/bin/env python
# coding: utf-8

# In[3]:


import pandas as pd
from subprocess import Popen, PIPE, call
lb = 'iwgsc_10_12_18'
path_target_finder = '/home/juan/Desktop/juan/bio/mrcv/sw/TargetFinder/targetfinder.pl'


# In[4]:


df = pd.read_csv('data/res/sRNA_DEG_mirbase.csv', sep='\t')
df.head()


# In[5]:


#search targets
out_file = open("data/res/targets.csv","w") 
out_total = ''
for k,v in df.iterrows():
    cmd_list = ['perl', path_target_finder,'-s',v.MajorRNA,'-q',v.Gene,'-d','data/res/DEG_SEQS.fasta','-p','table']
    print(' '.join(cmd_list))
    pro = Popen(cmd_list, stdout=PIPE, stderr=PIPE)
    out,err = pro.communicate()
    print(out,err)
    out_total += out.decode("utf-8") 
out_file.write(out_total)
out_file.close()
#os.system('grep -v "No results for" targets.csv > targets.clean.csv')


# In[ ]:




