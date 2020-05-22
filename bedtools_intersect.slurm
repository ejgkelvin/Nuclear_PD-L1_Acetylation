#!/bin/bash
#SBATCH -p short                # Partition to submit to
#SBATCH -t 0-12:00              # Time in minutes
#SBATCH -c 6                    # Number of cores requested
#SBATCH -N 1                    # Ensure that all cores are on one machine (span[hosts=1])
#SBATCH --mem=12G               # Memory total in GB (see also --mem-per-cpu)
#SBATCH --mail-type=END
#SBATCH --mail-user=chen_chu@hms.harvard.edu


module load gcc/6.2.0  
module load bedtools/2.27.1

bedtools intersect -a XX.bed -b XXX.bed -wa -wb > XXvsXXX.bed
