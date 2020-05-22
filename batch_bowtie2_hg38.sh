#!/bin/bash
#initialize a variable with an intuitive name to store the name of the input fastq file
fq=$1

#grab base of file name for naming outputs
base=`basename $fq. fastq`
echo "Sample name is $base"

#directory with bowtie genome index
genome=/n/data2/dfci/cancerbio/sicinski/reference_data/hg38

#set up output filenames and locations
align_out=/n/data2/dfci/cancerbio/sicinski/results/bowtie2-2.2.9/${base}_unsorted.sam
align_bam=/n/data2/dfci/cancerbio/sicinski/results/bowtie2-2.2.9/${base}_unsorted.bam
align_sorted=/n/data2/dfci/cancerbio/sicinski/results/bowtie2-2.2.9/${base}_sorted.bam
align_filtered=/n/data2/dfci/cancerbio/sicinski/results/bowtie2-2.2.9/${base}_aln.bam

#set up more variables for 2 additional directories to help clean up the results folder
bowtie_results=/n/data2/dfci/cancerbio/sicinski/results/bowtie2-2.2.9
intermediate_bams=/n/data2/dfci/cancerbio/sicinski/results/bowtie2-2.2.9/intermediate_bams

# set up the software environment
module load fastqc/0.11.3
module load gcc/6.2.0  
module load bowtie2/2.2.9
module load samtools/1.3.1
export PATH=/n/app/bcbio/tools/bin:$PATH 	# for using 'sambamba'

echo "Processing file $fq"

# Run bowtie2
bowtie2 -p 6 -q --local -x $genome -U $fq -S $align_out

# Create BAM from SAM
samtools view -h -S -b -@ 6 -o $align_bam $align_out

# Sort BAM file by genomic coordinates
sambamba sort -t 6 -o $align_sorted $align_bam

# Filter out duplicates
sambamba view -h -t 6 -f bam -F "[XS] == null and not unmapped " $align_sorted > $align_filtered

#Index the final aln_bam file
samtools index $align_filtered $align_filtered.bai

# Move intermediate files out of the bowtie2 directory
mv $bowtie_results/${base}*sorted* $intermediate_bams


# This script takes a fastq file of ChIP-Seq data, runs FastQC and outputs a BAM file for it that is ready for peak calling. Bowtie2 is the aligner used, and the outputted BAM file is sorted by genomic coordinates and has duplicate reads removed using sambamba.
# USAGE: sh batch_bowtie2.sh <path to the fastq file>


