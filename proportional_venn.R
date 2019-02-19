library(eulerr)
combo <- c(A = 538, B = 1979, "A&B" = 407)

pdf('venn.pdf', wid=4, hei=4)
plot(euler(combo), quantities = T, legend = T, fills = NA)
dev.off()
