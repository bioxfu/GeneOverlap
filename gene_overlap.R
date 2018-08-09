library(magrittr)
library(GeneOverlap)
library(gplots)
library(plotrix)

options(stringsAsFactors = F)
genome <- read.table('geneOverlap_bg_tair10_genes')

geneListFiles <- c('geneList1', 'geneList2', 'geneList3', 'geneList4')
#geneListFiles <- c('geneList1', 'geneList2', 'geneList3')
#geneListFiles <- c('geneList1', 'geneList2')

gene_lst <- list()
for (i in 1:length(geneListFiles)) {
  gene_lst[[i]] <- read.table(geneListFiles[i])$V1 %>% unique()
}
names(gene_lst) <- geneListFiles

mat <- NULL
for (i in 1:(length(gene_lst)-1)) {
  for (j in (i+1):length(gene_lst)) {
    go.obj <- newGeneOverlap(gene_lst[[i]], gene_lst[[j]], genome.size=nrow(genome)) %>% testGeneOverlap()
    num <- getIntersection(go.obj) %>% length()
    p <- getPval(go.obj) %>% format(digits=2)
    mat <- rbind(mat, c(names(gene_lst)[i], names(gene_lst)[j], num, p))
  }
}
colnames(mat) <- c('List1', 'List2', 'Number', 'P-value')

pdf('gene_overlap.pdf', wid=10)
layout(matrix(c(1,2),nrow=1), wid=c(2,1))
par(mar=c(2,2,2,2))
par(xpd=T)
venn(gene_lst)
plot(0, type='n', xaxt='n', yaxt='n', bty='n')
addtable2plot(0.45, 0, mat, display.rownames=F, display.colnames=T, bty='n')
dev.off()

