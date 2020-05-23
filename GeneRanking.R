# This is to plot ranking for Fig 6j

# Load packages
library(tidyverse)
library(ggrepel) # This is for labeling the dots
library(extrafont) # This package is for changing the font in the figure
font_import() # This is to import all the available fonts
loadfonts(device = "win")

# Load the peak gene information
ChIPpeakGenes <- readClipboard()
RNAseqMB231_Rank <- read_delim(file = 'Data/MB231_diff_Sig_sorted.txt',delim = '\t')

# Tidyversing the data
RNAseqMB231_Rank <- RNAseqMB231_Rank %>%   
  filter(Log2FC != 'inf') %>%   # 1. Remove the rows where Log2FC = inf
  filter(Log2FC != '#NAME?') 

RNAseqMB231_Rank <- tibble::rowid_to_column(RNAseqMB231_Rank, "ID") # This creates the rank!
RNAseqMB231_Rank <- RNAseqMB231_Rank %>% 
  mutate(peakGenes = case_when(gene %in% ChIPpeakGenes ~ "Yes")) %>% 
  mutate(peakGenes =replace_na(peakGenes,replace=c('No')))
RNAseqMB231_Rank2 <- RNAseqMB231_Rank %>% 
  filter(peakGenes == 'Yes')


HighlightGenes <- c('BIRC3','RELB','TRAF1','HLA-A','HLA-B','HLA-H','VSIR','CD276','VTCN1','PDCD1LG2')
HighlightGenes2 <- c('BIRC3','RELB','TRAF1','VSIR','CD276','VTCN1') # Only include positive peak genes

# Plot the generanking plot
ggGeneRank <- ggplot(RNAseqMB231_Rank,aes(x = ID, y = Log2FC,color = peakGenes)) +
  geom_point(position = position_jitterdodge(0.2),size = 1.5) +
  geom_text_repel(aes(label = gene,fontface = 'italic',family = 'Arial'), 
                  data = RNAseqMB231_Rank[RNAseqMB231_Rank$gene %in% HighlightGenes2,],box.padding  = 0, 
                  point.padding = 0,
                  segment.color = 'black',nudge_x = -800,nudge_y = 5.5,force = 6) +
  theme_classic() +
  xlab("Rank of significantly changed genes") +
  ylab("Log2FC") +
  ggtitle("") +
  theme(plot.title = element_text(hjust=0, 
                                  face = "plain")) +
  scale_color_manual(labels = c("",'PD-L1 peak genes'),values = c('gray40','red2')) + # Change the Colors of the plot
  theme(legend.title = element_blank(),
        legend.text = element_text(size=rel(1.3),face='plain',family = 'Arial'),
        axis.text.x = element_text(size=rel(1.6),face = 'plain',family = 'Arial'), 
        axis.text.y = element_text(size=rel(1.6),face = 'plain',family = 'Arial'),
        axis.title = element_text(size=rel(1.3),face = 'plain',family = 'Arial'),
        legend.position = 'top',aspect.ratio = 0.75)
ggsave('./Figures/GeneRank.png',plot=ggGeneRank,dpi=1200) # export the figure in high quality

# Version 2, only include positive dots in red!
ggGeneRank2 <- ggplot(RNAseqMB231_Rank2, aes(x = ID, y = Log2FC, color = peakGenes)) +
  geom_point(position = position_jitterdodge(1),size = 1) +
  geom_text_repel(aes(label = gene,fontface = 'italic',family = 'Arial'), 
                  data = RNAseqMB231_Rank[RNAseqMB231_Rank$gene %in% HighlightGenes2,],box.padding  = 0, 
                  point.padding = 0,
                  segment.color = 'black',nudge_x = -800,nudge_y = 5.5,force = 6) +
  theme_classic() +
  xlab("Rank of significantly changed PD-L1 peak genes") +
  ylab("Log2FC") +
  ggtitle("") +
  theme(plot.title = element_text(hjust=0, 
                                  face = "plain")) +
  scale_color_manual(labels = c('PD-L1 peak genes'),values = c('red2')) + # Change the Colors of the plot
  theme(legend.title = element_blank(),
        legend.text = element_text(size=rel(1.3),face='plain',family = 'Arial'),
        axis.text.x = element_text(size=rel(1.6),face = 'plain',family = 'Arial'), 
        axis.text.y = element_text(size=rel(1.6),face = 'plain',family = 'Arial'),
        axis.title = element_text(size=rel(1.3),face = 'plain',family = 'Arial'),
        legend.position = 'top',aspect.ratio = 0.75)
ggsave('./Figures/GeneRank2.png',plot=ggGeneRank2,dpi=1200) # export the figure in high quality



write.csv(RNAseqMB231_Rank,file = 'GeneRankwithPDL1peak.csv')
