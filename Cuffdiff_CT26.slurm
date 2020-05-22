#!/bin/bash

#SBATCH -p short                # partition name
#SBATCH -t 0-12:00              # hours:minutes runlimit after which job will be killed
#SBATCH --mem 40G
#SBATCH -n 15           # number of cores requested -- this needs to be greater than or equal to the number of cores you plan to use to run your job
#SBATCH --job-name Cuffdiff              # Job name
#SBATCH -o %j.out                       # File to which standard out will be written
#SBATCH -e %j.err               # File to which standard error will be written
#SBATCH --mail-type=END
#SBATCH --mail-user=chen_chu@hms.harvard.edu

#load modules needed for this script
module load cufflinks/2.2.1

#run the script
 cuffdiff /home/cc452/sicinskilab/reference_data/Mus_musculus.GRCm38.92.gtf \
 -L KO,KO_WT,KO_KQ --num-threads 20 --upper-quartile-norm --total-hits-norm \
CT26_KO_1_1.fq.gzAligned.sortedByCoord.out.bam,CT26_KO_2_1.fq.gzAligned.sortedByCoord.out.bam,CT26_KO_3_1.fq.gzAligned.sortedByCoord.out.bam \
CT26_WT_1_1.fq.gzAligned.sortedByCoord.out.bam,CT26_WT_2_1.fq.gzAligned.sortedByCoord.out.bam,CT26_WT_3_1.fq.gzAligned.sortedByCoord.out.bam \
CT26_K262Q_1_1.fq.gzAligned.sortedByCoord.out.bam,CT26_K262Q_2_1.fq.gzAligned.sortedByCoord.out.bam,CT26_K262Q_3_1.fq.gzAligned.sortedByCoord.out.bam
