#!/bin/bash

#SBATCH -p short 		# partition name
#SBATCH -t 0-8:00 		# hours:minutes runlimit after which job will be killed
#SBATCH -n 10 		# number of cores requested -- this needs to be greater than or equal to the number of cores you plan to use to run your job
#SBATCH --job-name multiBigWigSummary-bins		# Job name
#SBATCH -o %j.out			# File to which standard out will be written
#SBATCH -e %j.err 		# File to which standard error will be written
#SBATCH --mail-type=END
#SBATCH --mail-user=chen_chu@hms.harvard.edu

# load modules
module load gcc/6.2.0
module load python/2.7.12
module load deeptools/2.5.3

# run multiBigwigSummary-bins
multiBigwigSummary bins --bwfiles *.bw --outFileName BigWigreadCounts_MDA-MB-231_N.npz --outRawCounts BigWigreadCounts_MDA-MB-231_N.tab



