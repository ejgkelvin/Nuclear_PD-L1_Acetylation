#!/bin/bash

#this script takes a fastq or fasta RNA-seq file and align to the mouse genome

#initialize a variable with an intuitive name to store the name of the input fastq file
fq=$1

#load modules needed for this script
module load star/2.5.4a

#run the script
STAR --runThreadN 20 --genomeDir ~/sicinskilab/reference_data/STARgenomeMM10 \
 --readFilesIn $fq \
 --outFileNamePrefix STARoutput/$fq \
 --outSAMstrandField intronMotif \
 --outSAMtype BAM SortedByCoordinate \
 --outFilterIntronMotifs RemoveNoncanonical \
 --outWigType wiggle --outWigNorm None \
 --quantMode TranscriptomeSAM
  
