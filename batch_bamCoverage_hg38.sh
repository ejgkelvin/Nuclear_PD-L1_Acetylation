#!/bin/bash
#give a intuitive name to $1
Protein=$1

#grab base of file name for naming outputs
base=`basename $Protein .fastq._aln.bam`
echo "Sample name is $base"

# set up the software environment
module load gcc/6.2.0
module load python/2.7.12  
module load deeptools/2.5.3 

# Run bamCoverage
bamCoverage -b $Protein \
-o /home/cc452/sicinskilab/results/deeptools2.5.3/$base.bw \
--binSize 20 \
--normalizeTo1x 2913022398 \
--smoothLength 60 \
--extendReads 150 \
--centerReads \
-p 6 2> /home/cc452/sicinskilab/results/deeptools2.5.3/$base_bamCoverage.log

#End
