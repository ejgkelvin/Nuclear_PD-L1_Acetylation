# This is to plot the multi-level pie chart

# Load packages
library(tidyverse)
library(RColorBrewer)
library("viridis")  
library(patternplot)
source("https://raw.githubusercontent.com/imaddowzimet/drawcrosshatch/master/draw_crosshatch.R")

# Load data
piechart <- read_delim(file='./Data/200225PeakGenesinRNAseq.txt',delim = '\t')

# Plotting piechart
ggPiechart <- ggplot(piechart) + 
  geom_rect(aes(fill=Status,ymax = ymax, ymin = ymin, xmax=4, xmin=1),alpha = c(1,1,1,1,1,1)) +
  geom_rect(aes(color = Group,ymax = ymax,ymin = ymin, xmax=4, xmin=1),size = 1.2,fill = NA) +
  geom_segment(x = 3,xend = 3,y = 0.113616969401438,yend = 0.343106181,size = 1.2) +
  geom_segment(x = 3,xend = 3, y = 0.417408265,yend = 0.543764476,size = 1.2) +
  geom_segment(x = 3,xend = 3, y = 0.808058028,yend = 1,size = 1.2) +
  geom_segment(x = 2,xend = 2,y = 0.113616969401438,yend = 0.343106181,size = 1.2) +
  geom_segment(x = 2,xend = 2, y = 0.417408265,yend = 0.543764476,size = 1.2) +
  geom_segment(x = 2,xend = 2, y = 0.808058028,yend = 1,size = 1.2) +
  geom_segment(x = 3.5,xend = 3.5,y = 0.113616969401438,yend = 0.343106181,size = 1.2) +
  geom_segment(x = 3.5,xend = 3.5, y = 0.417408265,yend = 0.543764476,size = 1.2) +
  geom_segment(x = 3.5,xend = 3.5, y = 0.808058028,yend = 1,size = 1.2) +
  geom_segment(x = 2.5,xend = 2.5,y = 0.113616969401438,yend = 0.343106181,size = 1.2) +
  geom_segment(x = 2.5,xend = 2.5, y = 0.417408265,yend = 0.543764476,size = 1.2) +
  geom_segment(x = 2.5,xend = 2.5, y = 0.808058028,yend = 1,size = 1.2) +
  geom_segment(x = 1.5,xend = 1.5, y = 0.113616969401438,yend = 0.343106181,size = 1.2) +
  geom_segment(x = 1.5,xend = 1.5, y = 0.417408265,yend = 0.543764476,size = 1.2) +
  geom_segment(x = 1.5,xend = 1.5, y = 0.808058028,yend = 1,size = 1.2) +
  theme(axis.text.x = element_text(size=rel(1.2),face = 'bold'), axis.text.y = element_text(size=rel(1.2),face = 'bold'),
        axis.title = element_text(size=rel(1.2),face = 'bold'),
        legend.position = 'none',aspect.ratio = 1) +
  xlim(c(0, 4)) + 
  coord_polar(theta="y") +
  theme_void() +
  scale_fill_brewer(palette = "Spectral",direction = -1) +
  scale_color_manual(values = c('NA','black'), labels = c('','PDL1_peakGenes')) +
  theme(legend.title = element_blank(),legend.text = element_text(size=rel(1.8),face='plain'))

ggsave('./Figures/Piechart_PDL1_peakGeneinRNAseq200225.png',plot=ggPiechart,dpi=800)
