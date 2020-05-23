############################################################################################################################
# Create FPKM expression matrix directly using Cuffdiff output files
# Using 'cummeRbund package'
library(cummeRbund)
Cuff_CT26 <- readCufflinks(dir='./CT26')
Cuff_MB231 <- readCufflinks(dir='./MDA-MB-231') # add rebuild=T can rebuild the Cuff file

# Quality control and making plots
disp_CT26 <- dispersionPlot(genes(Cuff_CT26))
disp_MB231 <- dispersionPlot(genes(Cuff_MB231))
v_CT26 <- csVolcanoMatrix(genes(Cuff_CT26))
v_MB231 <- csVolcanoMatrix(genes(Cuff_MB231))

# Generate and export the expression Matrix (with replicates!)
gene.rep.matrix_CT26 <- repFpkmMatrix(genes(Cuff_CT26))
gene.rep.matrix_MB231 <- repFpkmMatrix(genes(Cuff_MB231))
gene.rep.matrix_annot_CT26 <- data.frame(annotation(genes(Cuff_CT26)),repFpkmMatrix(genes(Cuff_CT26)))
gene.rep.matrix_annot_MB231 <- data.frame(annotation(genes(Cuff_MB231)),repFpkmMatrix(genes(Cuff_MB231)))
write.csv(gene.rep.matrix_annot_CT26,file='CT26WTvsKO_ExpMatrix.csv')
write.csv(gene.rep.matrix_annot_MB231,file='MB231WTvsKO_ExpMatrix.csv')
