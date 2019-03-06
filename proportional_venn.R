library(RColorBrewer)
library(gplots)
library(eulerr)

# method 1
combo <- c(A = 538, B = 1979, "A&B" = 407)
pdf('venn.pdf', wid=4, hei=4)
plot(euler(combo), quantities = T, legend = T, fills = NA)
dev.off()

# method 2
plot_venn <- function(lst) {
  vn <- venn(lst, show.plot = F)
  vn_attr <- attr(vn, 'intersections')
  X <- sapply(vn_attr, length)
  names(X) <- gsub(':', '&', names(X))
  print(plot(euler(X), quantities=T, legend=T, fills=list(fill=brewer.pal(4, 'Set3')[1:4], alpha=1)))
}

gene_lst <- list(g1=read.table('example/geneList1')$V1,
                 g2=read.table('example/geneList2')$V1,
                 g3=read.table('example/geneList3')$V1)
pdf('venn2.pdf', wid=4, hei=4)
plot_venn(gene_lst)
dev.off()
