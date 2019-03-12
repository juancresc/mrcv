python3 -m MITETracker -g /mnt/disk/iwgsc_2/by_chr/1A.fasta -j new_IWGSC_1A --task candidates
python3 -m MITETracker -g /mnt/disk/iwgsc_2/by_chr/1B.fasta -j new_IWGSC_1B --task candidates
python3 -m MITETracker -g /mnt/disk/iwgsc_2/by_chr/1D.fasta -j new_IWGSC_1D --task candidates
python3 -m MITETracker -g /mnt/disk/iwgsc_2/by_chr/2A.fasta -j new_IWGSC_2A --task candidates
python3 -m MITETracker -g /mnt/disk/iwgsc_2/by_chr/2B.fasta -j new_IWGSC_2B --task candidates
python3 -m MITETracker -g /mnt/disk/iwgsc_2/by_chr/2D.fasta -j new_IWGSC_2D --task candidates
python3 -m MITETracker -g /mnt/disk/iwgsc_2/by_chr/3A.fasta -j new_IWGSC_3A --task candidates
python3 -m MITETracker -g /mnt/disk/iwgsc_2/by_chr/3B.fasta -j new_IWGSC_3B --task candidates
python3 -m MITETracker -g /mnt/disk/iwgsc_2/by_chr/3D.fasta -j new_IWGSC_3D --task candidates
python3 -m MITETracker -g /mnt/disk/iwgsc_2/by_chr/4A.fasta -j new_IWGSC_4A --task candidates
python3 -m MITETracker -g /mnt/disk/iwgsc_2/by_chr/4B.fasta -j new_IWGSC_4B --task candidates
python3 -m MITETracker -g /mnt/disk/iwgsc_2/by_chr/4D.fasta -j new_IWGSC_4D --task candidates
python3 -m MITETracker -g /mnt/disk/iwgsc_2/by_chr/5A.fasta -j new_IWGSC_5A --task candidates
python3 -m MITETracker -g /mnt/disk/iwgsc_2/by_chr/5B.fasta -j new_IWGSC_5B --task candidates
python3 -m MITETracker -g /mnt/disk/iwgsc_2/by_chr/5D.fasta -j new_IWGSC_5D --task candidates
python3 -m MITETracker -g /mnt/disk/iwgsc_2/by_chr/6A.fasta -j new_IWGSC_6A --task candidates
python3 -m MITETracker -g /mnt/disk/iwgsc_2/by_chr/6B.fasta -j new_IWGSC_6B --task candidates
python3 -m MITETracker -g /mnt/disk/iwgsc_2/by_chr/6D.fasta -j new_IWGSC_6D --task candidates
python3 -m MITETracker -g /mnt/disk/iwgsc_2/by_chr/7A.fasta -j new_IWGSC_7A --task candidates
python3 -m MITETracker -g /mnt/disk/iwgsc_2/by_chr/7B.fasta -j new_IWGSC_7B --task candidates
python3 -m MITETracker -g /mnt/disk/iwgsc_2/by_chr/7D.fasta -j new_IWGSC_7D --task candidates

mkdir results/all_IWGSC
cat results/new_IWGSC_*/candidates.csv > results/all_IWGSC/candidates.csv
cat results/new_IWGSC_*/candidates.fasta > results/all_IWGSC/candidates.fasta
python3 -m MITETracker -g none -w 2 -j all_IWGSC --task cluster --min_copy_number 4


8 marzo de 2019 a las 13pm