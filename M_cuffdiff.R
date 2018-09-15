setwd(".//M_diff_out/")
library(cummeRbund)
cuff_data <- readCufflinks('M_diff_out/')
cuff_data
pdf(file="M_Density.pdf")
csDensity(genes(cuff_data))
dev.off()

## test with self-made volcano plot
table <-read.table("diff_list_subset.diff", header = TRUE)
df <- data.frame(table)
df <-df[Reduce('&', lapply(df, is.finite)),]
colnames(df)[4] <- "log2FoldChange"

library("ggplot2")
require(ggplot2)
##Highlight genes that have an absolute fold change > 2 and a p-value < Bonferroni cut-off
df$threshold = as.factor(abs(df$log2FoldChange) > 1.5 & df$q_value <0.01)

##Construct the plot object
g = ggplot(data=df, aes(x=log2FoldChange, y=-log10(df$p_value), colour=threshold)) +
  geom_point(alpha=0.4, size=1.75) +
  theme(legend.position = "none") +
  xlim(c(-15, 15)) + ylim(c(0, 6)) +
  xlab("log2 fold change") + ylab("-log10 p-value")
g

gene_text = df[(abs(df$log2FoldChange) > 1.5) & (df$q_value < 0.01), ]
head(gene_text)
#g + geom_text(data=gene_text, aes(x=gene_text$log2FoldChange, y=-log10(gene_text$p_value), label=gene_text$gene), colour="black")


with(df, plot(df$log2.fold_change., -log10(df$p_value), pch=20, main="Volcano plot",))
# Add colored points:
with(subset(df, df$p_value < 0.01 ), points(df$log2.fold_change., -log10(df$p_value), pch=20, col="blue"))
with(subset(df, abs(df$log2.fold_change.)>1.5), points(df$log2.fold_change., -log10(df$p_value), pch=20, col="orange"))
with(subset(df, df$p_value < 0.01 & abs(df$log2.fold_change.)>1.5), points(df$log2.fold_change., -log10(df$p_value), pch=20, col="grey60"))

pdf(file="M_54_58_Scatter.pdf")
csScatter(genes(cuff_data), 'S54', 'S58')
dev.off()
pdf(file="M_61_58_Scatter.pdf")
csScatter(genes(cuff_data), 'S61', 'S58')
dev.off()
pdf(file="M_63_58_Scatter.pdf")
csScatter(genes(cuff_data), 'S63', 'S58')
dev.off()
pdf(file="M_65_58_Scatter.pdf")
csScatter(genes(cuff_data), 'S65', 'S58')
dev.off()

pdf(file="M_63_58_Volcano.pdf")
csVolcano(genes(cuff_data), 'S63', 'S58',showSignificant=TRUE, pseudocount=+1.0,alpha=0.05, features=TRUE, xlimits=c(-20,20))
dev.off()
pdf(file="M_54_58_Volcano.pdf")
csVolcano(genes(cuff_data), 'S54', 'S58',showSignificant=TRUE, alpha=0.05, features=TRUE)
dev.off()
pdf(file="M_61_58_Volcano.pdf")
csVolcano(genes(cuff_data), 'S61', 'S58',showSignificant=TRUE, alpha=0.05, features=TRUE)
dev.off()
pdf(file="M_65_58_Volcano.pdf")
csVolcano(genes(cuff_data), 'S65', 'S58',showSignificant=TRUE, alpha=0.05, features=TRUE)
dev.off()

## Get DE information from specific gene 
#mygene<- getGene(cuff_data, 'SOCS1')
#expressionBarplot(mygene)
#expressionBarplot(isoforms(mygene))

#gene_diff_data <- diffData(genes(cuff_data))
#sig_gene_data <- subset(gene_diff_data, (significant == 'yes'))
#nrow(sig_gene_data)

#isoform_diff_data <- diffData(isoforms(cuff_data), 'S54', 'S58')
#sig_isoform_data <- subset(isoform_diff_data, (significant == 'yes'))
#nrow(sig_isoform_data)
#tss_diff_data <- diffData(TSS(cuff_data), 'S54', 'S58')
#sig_tss_data <- subset(tss_diff_data, (significant =='yes'))
#nrow(sig_tss_data)
#cds_diff_data <- diffData(CDS(cuff_data), 'S54', 'S58')
#sig_cds_data <- subset(cds_diff_data, (significant =='yes'))
#nrow(sig_cds_data)
#promoter_diff_data <- distValues(promoters(cuff_data))
#sig_promoter_data <- subset(promoter_diff_data, (significant == 'yes'))
#nrow(sig_promoter_data)
#splicing_diff_data <- distValues(splicing(cuff_data))
#sig_splicing_data <- subset(splicing_diff_data, (significant == 'yes'))
#nrow(sig_splicing_data)
#relCDS_diff_data <- distValues(relCDS(cuff_data))
#sig_relCDS_data <- subset(relCDS_diff_data, (significant == 'yes'))
#nrow(sig_relCDS_data)

#Retrieve significant gene IDs (XLOC) with a pre-specified alpha
diffGeneIDs <- getSig(cuff_data, level="genes", alpha=0.05)

#Use returned identifiers to create a CuffGeneSet object with all relevant info for given genes 
diffGenes <- getGenes(cuff_data, diffGeneIDs)

#gene_short_name values (and corresponding XLOC_* values can be retrieved from the CuffGeneSet by this)
names <- featureNames(diffGenes)
row.names(names) = names$tracking_id
diffGeneNames<-as.matrix(names)
diffGeneNames<- diffGeneNames[,-1]

#get the data for the significant genes
diffGenesData <- diffData(diffGenes)
row.names(diffGenesData)=make.names(diffGenesData[,1],TRUE)
diffGenesData <- diffGenesData[,-1]
diffGenesOutput<-merge(diffGeneNames,diffGenesData, by="row.names")
diffGenesOutput<-diffGenesOutput[,-1]
colnames(diffGenesOutput)[1]<- "Gene"
sig_gene_data <- subset(diffGenesOutput, (significant =='yes'))

write.table(sig_gene_data, 'M_diff_genes.txt', sep='\t', row.names = F, col.names = T, quote = F)
