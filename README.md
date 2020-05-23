Nuclear_PD-L1_Acetylation


Yang Gao, Naoe Taira Nihira, Xia Bu, Chen Chu, Jinfang Zhang, Aleksandra Kolodziejczyk, Yizeng Fan, 
Ngai Ting Chan, Leina Ma, Jing Liu, Dong Wang, Xiaoming Dai, Huadong Liu, Masaya Ono, 
Akira Nakanishi, Hiroyuki Inuzuka, Brian J. North, Yu-Han Huang, Samanta Sharma, Yan Geng, 
Wei Xu, Lei Li, Yoshio Miki*, Piotr Sicinski*, Gordon J. Freeman*, Wenyi Wei*. Acetylation-dependent regulation of PD-L1 nuclear translocation 
dictates the efficacy of anti-PD-1 immunotherapy. Nat Cell Biol. 2020


These codes contain shell scripts run at Harvard O2 cluster, as well as R scripts run locally.


ChIP-seq

Genome alignment: batch_bowtie2_hg38.slurm, batch_bowtie2_hg38.sh

Peak calling: macs2.slurm, macs2_PE.slurm

Common PD-L1 binding peaks from two replicates: bedtools_intersect.slurm

De novo motif analysis: HOMER.slurm

Metagene plots and heatmap generation using ngsplot (Figure 6g, 6h): ngsplot_PDL1.slurm

Downloading publicly available datasets: batch_fastq-dump.slurm, batch_fastq-dump.sh, batch_fastq-dump_pairEnd.slurm batch_fastq-dump_pairEnd.sh

Colocalization study (Ext Data Fig. 5m): batch_bamCoverage_hg38.slurm, batch_bamCoverage_hg38.sh, multiBigwigSummary-bins.slurm, plotCorrelationSpearman.slurm, Colocalization plot.R

Statistics and plot for Figure 6i: Statistical Analyses.R,PieChart_PeakGenesinRNAseq.R



RNA-seq

Genome alignment: batch_STAR_hg38.slurm, batch_STAR_hg38.sh, batch_STAR_mm10.slurm, batch_STAR_mm10.sh

Identifying DEG: Cuffdiff_CT26.slurm, Cuffdiff_MB231.slurm

Processing Cuffdiff output: cummeRbund.R

RNA-seq and ChIP-seq overlap (Figure 6j): GeneRanking.R

Heatmap (Figure 6c, Ext Data Fig. 5h): pheatmap.R

Scatter Plot (Figure 7a): RNAseqScatter.R
 