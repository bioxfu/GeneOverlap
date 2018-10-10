# GeneOverlap Tutorial

### 1. Installation
- [R](https://www.r-project.org/)
- [magrittr](https://cran.r-project.org/web/packages/magrittr/index.html)
- [gplots](https://cran.r-project.org/web/packages/gplots/index.html)
- [plotrix](https://cran.r-project.org/web/packages/plotrix/index.html)
- [GeneOverlap](http://www.bioconductor.org/packages/release/bioc/html/GeneOverlap.html)

### 2. Two gene sets overlap
```
Rscript gene_overlap.R example/geneList1 example/geneList2
```
![Figure1](example/gene_overlap_geneList1_geneList2.png?raw=true)
### 3. Three gene sets overlap
```
Rscript gene_overlap.R example/geneList1 example/geneList2 example/geneList3
```
![Figure2](example/gene_overlap_geneList1_geneList2_geneList3.png?raw=true)
### 4. Four gene sets overlap
```
Rscript gene_overlap.R example/geneList1 example/geneList2 example/geneList3 example/geneList4
```
![Figure3](example/gene_overlap_geneList1_geneList2_geneList3_geneList4.png?raw=true)


