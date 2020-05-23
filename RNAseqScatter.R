##########################################################################################################################
# Plot the RNAseq figures using ggplot2
# Load the packages
library(tidyverse)
library(ggrepel) # This is for labeling the dots
library(RColorBrewer)
# already installed: 
# install.packages("devtools")
# devtools::install_github("baptiste/egg")
library(egg) # This package is for the arrange of different figures!!!

###########################################################################################################
# Load the dataset as tibble
RNAseqMB231 <- read_delim(file=file.choose(),delim = '\t')

# Data wrangling
RNAseqMB231 <- RNAseqMB231 %>% 
  mutate(WTLog2=log2(value_1),KOLog2=log2(value_2)) # Take log2 FPKM values for plotting
RNAseqMB231 <- RNAseqMB231 %>% 
  dplyr::rename(Log2FC = `log2(fold_change)`)
RNAseqMB231 <- RNAseqMB231 %>% 
  mutate(Change=case_when(Log2FC > 0 & significant == 'yes' ~ "Up", Log2FC < 0 & significant == 'yes' ~ "Down", significant == 'no' ~ "No change")) # use case_when to classify the genes

###########################################################################################################
# Label genes to be highlighted on the plot
HighlightGenes_MB231_Down <- c('CEACAM1','CD200','CD276','FGL1','VSIR','HHLA2','CD48','TNFSF14','IDO1',
                          'VTCN1','TDO2','ICOSLG','LGALS9','CD47','SIGLEC15','PDCD1LG2')
HighlightGenes_MB231_Up <- c('PVR')

# Plot scatter plot using ggplot2
# Scatter plot of FPKM
ggRNAseqMB231_Scatter <- ggplot(RNAseqMB231,aes(x=WTLog2,y=KOLog2,color=Change,label = gene)) +
  geom_point(size=1.5) +
  geom_abline(size=1.2,linetype=2) +
  geom_text_repel(data = RNAseqMB231[RNAseqMB231$gene %in% HighlightGenes_MB231_Down,],box.padding   = 0, 
                  point.padding = 0,
                  segment.color = 'black',nudge_x = 8,nudge_y = 3,force = 10) +
  geom_text_repel(data = RNAseqMB231[RNAseqMB231$gene %in% HighlightGenes_MB231_Up,],box.padding   = 0, 
                  point.padding = 0,
                  segment.color = 'black',nudge_x = -8,nudge_y = 3,force = 10) +
  theme_bw() +
  theme(axis.text.x = element_text(size=rel(1.2),face = 'bold'), axis.text.y = element_text(size=rel(1.2),face = 'bold'),
        axis.title = element_text(size=rel(1.2),face = 'bold'),
        legend.position = 'right',aspect.ratio = 1) +
  xlab("Log2(FPKM) WT") +
  ylab("Log2(FPKM) KO") +
  xlim(-4,15) +
  ylim(-4,15) +
  ggtitle("Transcriptomes of WT vs KO") +
  theme(plot.title = element_text(hjust=0, 
                                  face = "bold")) + 
  scale_color_manual(values = c('dodgerblue4','gray40','red2')) + # Change the Colors of the plot
  theme(legend.title = element_blank(),legend.text = element_text(size=rel(1.05),face='bold'))
ggsave('RNAseqMB231_Scatter_1.png',plot=ggRNAseqMB231_Scatter,dpi=1200) # export the figure in high quality


##############################################################################################################












