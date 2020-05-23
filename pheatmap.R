############################################################################################################################
# Extract 'Hallmark interferon alpha response genes' from expression matrix 
# load the list of genes belonging to 'Hallmark interferon alpha response'
IFNa_genes_H <- readClipboard()
IFNg_genes_H <- readClipboard()

MB231_IFNa_genes_Exp<- gene.rep.matrix_annot_MB231[tolower(gene.rep.matrix_annot_MB231$gene_short_name) %in% tolower(IFNa_genes_H),] 
MB231_IFNg_genes_Exp<- gene.rep.matrix_annot_MB231[tolower(gene.rep.matrix_annot_MB231$gene_short_name) %in% tolower(IFNg_genes_H),] 
#################################################################################


# Plot Heatmap of the gene expression patterns across replicates


library(pheatmap)
library(RColorBrewer)

pdf(file='MB231_IFNa_genes_names_colored.pdf')
.rowNamesDF(MB231_IFNa_genes_Exp,make.names=T) <- MB231_IFNa_genes_Exp[,4] # change rownames from geneID to geneName
pheatmap(MB231_IFNa_genes_Exp[,18:25],show_rownames = T,fontsize_row=5,scale='row',color=colorRampPalette(rev(brewer.pal(n=11,name="RdBu")))(100))
dev.off()

row_sub_MB231_IFNg_genes <- apply(MB231_IFNg_genes_Exp[,18:25], 1, function(row) all(row !=0))
MB231_IFNg_genes_Heatmap <- MB231_IFNg_genes_Exp[row_sub_MB231_IFNg_genes,]
pdf(file='MB231_IFNg_genes_names_colored.pdf')
.rowNamesDF(MB231_IFNg_genes_Heatmap,make.names=T) <- MB231_IFNg_genes_Heatmap[,4] # change rownames from geneID to geneName
pheatmap(MB231_IFNg_genes_Heatmap[,18:25],show_rownames = T,fontsize_row=3,scale='row',color=colorRampPalette(rev(brewer.pal(n=11,name="RdBu")))(100))
dev.off()