#!/bin/bash

#SBATCH -p short 		# partition name
#SBATCH -t 0-8:00 		# hours:minutes runlimit after which job will be killed
#SBATCH -n 6 		# number of cores requested -- this needs to be greater than or equal to the number of cores you plan to use to run your job
#SBATCH --job-name batch_bowtie2		# Job name
#SBATCH -o %j.out			# File to which standard out will be written
#SBATCH -e %j.err 		# File to which standard error will be written
#SBATCH --mail-type=END
#SBATCH --mail-user=chen_chu@hms.harvard.edu

# this `for` loop, will take chip-seq fastq files as input and output filtered BAM files ready for peak calling.

for fq in /n/data2/dfci/cancerbio/sicinski/raw_data/ToBeDoneBowtie2/*
do
  echo "running analysis on $fq"
sbatch -p short -t 0-8:00 -n 10 --job-name batch_bowtie2 --wrap="sh batch_bowtie2_hg38.sh $fq"
sleep 1 #wait 1 second between each job submission
done
