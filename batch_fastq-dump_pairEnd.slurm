#!/bin/bash

#SBATCH -p short 		# partition name
#SBATCH -t 0-12:00 		# hours:minutes runlimit after which job will be killed
#SBATCH --mem 10G
#SBATCH -n 6 		# number of cores requested -- this needs to be greater than or equal to the number of cores you plan to use to run your job
#SBATCH --job-name batch_fastq-dump_outer		# Job name
#SBATCH -o %j.out			# File to which standard out will be written
#SBATCH -e %j.err 		# File to which standard error will be written
#SBATCH --mail-type=END
#SBATCH --mail-user=chen_chu@hms.harvard.edu

module load gcc/6.2.0
module load sratoolkit/2.9.0


# for every SRR in the list of SRRs file
for srr in $(cat /n/data2/dfci/cancerbio/sicinski/raw_data/SRR_Acc_List.txt)
do
# call the bash script that does the fastq dump, passing it the SRR number next in file
sh batch_fastq-dump_pairEnd.sh $srr
done
