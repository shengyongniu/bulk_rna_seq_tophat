setwd("/restricted/projectnb/chengcancer/Simon/project/T2D//bulk_RNA-seq//merge_170415_NB501164_170506_NB501164//2mapping")
library(cummeRbund)
cuff_data <- readCufflinks('CD8_diff_out/')
cuff_data
pdf(file="CD8_Density.pdf")
csDensity(genes(cuff_data))
dev.off()

pdf(file="CD8_54_58_Scatter.pdf")
csScatter(genes(cuff_data), 'S54', 'S58')
dev.off()
pdf(file="CD8_61_58_Scatter.pdf")
csScatter(genes(cuff_data), 'S61', 'S58')
dev.off()
pdf(file="CD8_65_58_Scatter.pdf")
csScatter(genes(cuff_data), 'S65', 'S58')
dev.off()

pdf(file="CD8_65_58_Volcano.pdf")
csVolcano(genes(cuff_data), 'S65', 'S58' ,showSignificant=TRUE, alpha=0.05, features=TRUE)
dev.off()
pdf(file="CD8_54_58_Volcano.pdf")
csVolcano(genes(cuff_data), 'S54', 'S58',showSignificant=TRUE, alpha=0.05, features=TRUE)
dev.off()
pdf(file="CD8_61_58_Volcano.pdf" )
csVolcano(genes(cuff_data), 'S61', 'S58',showSignificant=TRUE, alpha=0.05, features=TRUE)
dev.off()

## Get DE information from specific gene 
#mygene<- getGene(cuff_data, 'SOCS1')
#expressionBarplot(mygene)
#expressionBarplot(isoforms(mygene))

# gene_diff_data <- diffData(genes(cuff_data))
# sig_gene_data <- subset(gene_diff_data, (significant == 'yes'))
# nrow(sig_gene_data)
# 
# isoform_diff_data <- diffData(isoforms(cuff_data), 'S54', 'S58')
# sig_isoform_data <- subset(isoform_diff_data, (significant == 'yes'))
# nrow(sig_isoform_data)
# tss_diff_data <- diffData(TSS(cuff_data), 'S54', 'S58')
# sig_tss_data <- subset(tss_diff_data, (significant =='yes'))
# nrow(sig_tss_data)
# cds_diff_data <- diffData(CDS(cuff_data), 'S54', 'S58')
# sig_cds_data <- subset(cds_diff_data, (significant =='yes'))
# nrow(sig_cds_data)
# promoter_diff_data <- distValues(promoters(cuff_data))
# sig_promoter_data <- subset(promoter_diff_data, (significant == 'yes'))
# nrow(sig_promoter_data)
# splicing_diff_data <- distValues(splicing(cuff_data))
# sig_splicing_data <- subset(splicing_diff_data, (significant == 'yes'))
# nrow(sig_splicing_data)
# relCDS_diff_data <- distValues(relCDS(cuff_data))
# sig_relCDS_data <- subset(relCDS_diff_data, (significant == 'yes'))
# nrow(sig_relCDS_data)

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
write.table(sig_gene_data, 'CD8_diff_genes.txt', sep='\t', row.names = F, col.names = T, quote = F)
