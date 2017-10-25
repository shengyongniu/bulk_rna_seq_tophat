#!/bin/bash -l

module load boost/boost_1_51_0_gnu446
module load cufflinks/2.2.1
WORK_DIR=/restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/merge_170415_NB501164_170506_NB501164/2mapping
GENE_DIR=/restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/Homo_sapiens/UCSC/hg38/Annotation/Archives/archive-2015-08-14-08-18-15/Genes
GENOME_DIR=/restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/Homo_sapiens/UCSC/hg38/Sequence/WholeGenomeFasta

#cuffmerge -o /restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/merge_170415_NB501164_170506_NB501164/2mapping/CD4_merged_asm -g /restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/Homo_sapiens/UCSC/hg38/Annotation/Archives/archive-2015-08-14-08-18-15/Genes/genes.gtf -s /restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/Homo_sapiens/UCSC/hg38/Sequence/BowtieIndex/genome.fa -p 4  /restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/merge_170415_NB501164_170506_NB501164/2mapping/CD4_assemblies.txt 

#cuffmerge  -o /restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/merge_170415_NB501164_170506_NB501164/2mapping/CD8_merged_asm -g /restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/Homo_sapiens/UCSC/hg38/Annotation/Archives/archive-2015-08-14-08-18-15/Genes/genes.gtf -s /restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/Homo_sapiens/UCSC/hg38/Sequence/BowtieIndex/genome.fa -p 4  /restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/merge_170415_NB501164_170506_NB501164/2mapping/CD8_assemblies.txt 

#cuffmerge -o /restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/merge_170415_NB501164_170506_NB501164/2mapping/M_merged_asm -g /restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/Homo_sapiens/UCSC/hg38/Annotation/Archives/archive-2015-08-14-08-18-15/Genes/genes.gtf -s /restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/Homo_sapiens/UCSC/hg38/Sequence/BowtieIndex/genome.fa -p 4  /restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/merge_170415_NB501164_170506_NB501164/2mapping/M_assemblies.txt 

#cuffmerge -o /restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/merge_170415_NB501164_170506_NB501164/2mapping/B_merged_asm -g /restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/Homo_sapiens/UCSC/hg38/Annotation/Archives/archive-2015-08-14-08-18-15/Genes/genes.gtf -s /restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/Homo_sapiens/UCSC/hg38/Sequence/BowtieIndex/genome.fa -p 4  /restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/merge_170415_NB501164_170506_NB501164/2mapping/B_assemblies.txt

cuffmerge -o $WORK_DIR/45hr_merged_asm -g $GENE_DIR/genes.gtf -s $GENOME_DIR/genome.fa -p 4  $WORK_DIR/45hr_assemblies.txt
