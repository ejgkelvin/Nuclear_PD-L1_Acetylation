#!/bin/bash

#SBATCH -p short 		# partition name
#SBATCH -t 0-12:00 		# hours:minutes runlimit after which job will be killed
#SBATCH -n 4 		# number of cores requested -- this needs to be greater than or equal to the number of cores you plan to use to run your job
#SBATCH --job-name batch_STAR		# Job name
#SBATCH -o %j.out			# File to which standard out will be written
#SBATCH -e %j.err 		# File to which standard error will be written
#SBATCH --mail-type=END
#SBATCH --mail-user=chen_chu@hms.harvard.edu

# this 'for' loop script will do STAR alignment to all the fastq files in the directory

for fq in ./*.fastq

do
  echo "running analysis on $fq"
sbatch -p short -t 0-8:00 --mem 40G -n 8 --job-name batch_STAR --wrap="sh batch_STAR_hg38.sh $fq"
sleep 1 #wait 1 second between each job submission
done
  

