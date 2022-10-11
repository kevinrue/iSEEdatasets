library(scRNAseq)
library(scater)

# Example data ----
sce <- ReprocessedAllenData(assays="tophat_counts")
class(sce)


sce <- logNormCounts(sce, exprs_values="tophat_counts")

sce <- runPCA(sce, ncomponents=4)
sce <- runTSNE(sce)
rowData(sce)$ave_count <- rowMeans(assay(sce, "tophat_counts"))
rowData(sce)$n_cells <- rowSums(assay(sce, "tophat_counts") > 0)

saveRDS(sce, "ReprocessedAllenData.rds")
