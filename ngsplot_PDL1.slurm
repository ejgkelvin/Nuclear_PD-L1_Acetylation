#!/bin/bash

#SBATCH -p short 		# partition name
#SBATCH -t 0-12:00 		# hours:minutes runlimit after which job will be killed
#SBATCH -n 5 		# number of cores requested -- this needs to be greater than or equal to the number of cores you plan to use to run your job
#SBATCH --mem 30G
#SBATCH --job-name ngsplot		# Job name
#SBATCH -o %j.out			# File to which standard out will be written
#SBATCH -e %j.err 		# File to which standard error will be written
#SBATCH --mail-type=END
#SBATCH --mail-user=chen_chu@hms.harvard.edu

module load gcc/6.2.0
module load R/3.5.1
module load python/2.7.12


# Run the main command
ngs.plot.r -G hg38 -R tss -C config_PDL1.txt -O PDL1_2reps_TSS_5k -D ensembl -L 5000 -FL 150 -SC global -FS 20
