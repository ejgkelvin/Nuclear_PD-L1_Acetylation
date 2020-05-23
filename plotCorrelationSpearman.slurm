#!/bin/bash

#SBATCH -p short                # partition name
#SBATCH -t 0-8:00               # hours:minutes runlimit after which job will be killed
#SBATCH -n 4           # number of cores requested -- this needs to be greater than or equal to the number of cores you plan to use to run your job
#SBATCH --job-name multiBigWigSummary-bins              # Job name
#SBATCH -o %j.out                       # File to which standard out will be written
#SBATCH -e %j.err               # File to which standard error will be written
#SBATCH --mail-type=END
#SBATCH --mail-user=chen_chu@hms.harvard.edu


# this manuscript will do plotCorrelation Spearman Method

# load modules
module load gcc/6.2.0
module load python/2.7.12
module load deeptools/2.5.3

# run plotCorrelation Pearson
plotCorrelation -in BigWigreadCounts_MDA-MB-231_N.npz --corMethod spearman --skipZeros --plotTitle "Spearman_MB231_binMode" --whatToPlot heatmap --colorMap RdYlBu_r -o heatmap_SpearmanCorr_MB231_binMode_N.pdf --outFileCorMatrix SpearmanCorr_MB231_binMode_N.tab

