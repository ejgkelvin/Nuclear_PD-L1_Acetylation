#!/bin/bash
#SBATCH -p short		# Partition to submit to
#SBATCH -t 0-12:00		# Time in minutes
#SBATCH -c 6                    # Number of cores requested
#SBATCH -N 1                    # Ensure that all cores are on one machine (span[hosts=1])
#SBATCH --mem=12G               # Memory total in GB (see also --mem-per-cpu)
#SBATCH --mail-type=END
#SBATCH --mail-user=chen_chu@hms.harvard.edu


# Load modules
module load gcc/6.2.0
module load python/2.7.12
module load macs2/2.1.1.20160309 

macs2 callpeak -t ~/sicinskilab/results/bowtie2/Wenyi/PDL1_ChIPseq_Batch1_OlaRep1/PDL1_ChIP_aln.bam -c ~/sicinskilab/results/bowtie2/Wenyi/PDL1_ChIPseq_Batch1_OlaRep1/Input_aln.bam -f BAMPE -g hs -n PDL1 --broad --broad-cutoff 0.05 --outdir . 2> PDL1_Broad.log
