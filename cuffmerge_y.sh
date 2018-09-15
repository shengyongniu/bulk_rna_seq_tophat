#!/bin/bash -l

module load boost/boost_1_51_0_gnu446
module load cufflinks/2.2.1
WORK_DIR=./2mapping
GENE_DIR=./Genes
GENOME_DIR=./WholeGenomeFasta

cuffmerge -o $WORK_DIR/45hr_merged_asm -g $GENE_DIR/genes.gtf -s $GENOME_DIR/genome.fa -p 4  $WORK_DIR/45hr_assemblies.txt
