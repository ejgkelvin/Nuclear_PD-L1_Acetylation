#!/bin/bash
#SBATCH -p short                # Partition to submit to
#SBATCH -t 0-12:00              # Time in minutes
#SBATCH -c 8                    # Number of cores requested
#SBATCH -N 1                    # Ensure that all cores are on one machine (span[hosts=1])
#SBATCH --mem=12G               # Memory total in GB (see also --mem-per-cpu)
#SBATCH --mail-type=END
#SBATCH --mail-user=chen_chu@hms.harvard.edu


module load gcc/6.2.0  
module load homer/4.10.3

findMotifsGenome.pl Merge_forGREAT.bed genomes/hg38.fa IntersectedPeaks_MotifOutput/ -size given -mask
