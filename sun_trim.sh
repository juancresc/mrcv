
cd /home/juan/Desktop/juan/bio/mrcv/data/sun
export PATH=$PATH:/home/juan/Desktop/juan/bio/sw/Trimmomatic-0.38
for file_name in SRR1196023 SRR1196045 SRR1196029 SRR1196022 SRR1195944 SRR1195282 SRR1195281 SRR1195280 SRR1195279 SRR1195024 SRR1195025
do 
    ${file_name}
done