library(ggplot2)
library("DESeq2")

countData <- read.csv("C:\\Users\\hassa\\Downloads\\featurecounts.Rmatrix-2 (1).txt", header = TRUE, sep = ",")
head(countData)

metaData <- read.csv("C:\\Users\\hassa\\Downloads\\Variable (1) (1).txt", header = TRUE, sep = ",")
metaData

dds <- DESeqDataSetFromMatrix(countData=countData, 
                              colData=metaData, 
                              design= ~variable, tidy = TRUE)
dds<- estimateSizeFactors(dds)
idx<- rowSums( counts(dds, normalized=TRUE) >= 10) >=3

dds<- dds[idx,]

dds <- DESeq(dds)

res <- results(dds)
head(results(dds, tidy=TRUE)) 

res <- res[order(res$padj),]
head(res, n = 6)


write.csv(res, "C:\\Users\\hassa\\OneDrive\\Documents\\Masters dissertation\\featurecounts_text_table\\new.csv", row.names = TRUE)

par(mfrow=c(2,3))
plotCounts(dds, gene="ENSG00000211843", intgroup="variable")
plotCounts(dds, gene="ENSG00000211861", intgroup="variable")
plotCounts(dds, gene="ENSG00000211713", intgroup="variable")
plotCounts(dds, gene="ENSG00000211713", intgroup="variable")
plotCounts(dds, gene="ENSG00000275743", intgroup="variable")
plotCounts(dds, gene="ENSG00000211706", intgroup="variable")

#volcano plot

if (!requireNamespace('BiocManager', quietly = TRUE))
  install.packages('BiocManager')

BiocManager::install('EnhancedVolcano')

install.packages("textshaping")
library(EnhancedVolcano)
library(ggrepel)

seq_analysis <- read.csv("C:/Users/hassa/OneDrive/Documents/Masters dissertation/featurecounts_text_table/DESeq2 analysis/RNA seq analysis completed with gene names.csv",row.names = 1)


EnhancedVolcano(seq_analysis, x = "log2FoldChange", y = "padj", lab = seq_analysis$name)


