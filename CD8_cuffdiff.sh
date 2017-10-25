#!/bin/bash -l


module load boost/boost_1_51_0_gnu446
module load cufflinks/2.2.1


cuffdiff -o CD8_diff_out -b /restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/Homo_sapiens/UCSC/hg38/Sequence/BowtieIndex/genome.fa  -p 8 -L S54,S58,S61,S65  -u ./CD8_merged_asm/merged.gtf ./54_CD8_S4_170415_NB501164_170506_NB501164_thout/accepted_hits.bam  ./58_CD8_S8_170415_NB501164_170506_NB501164_thout/accepted_hits.bam  ./61_CD8_S11_170415_NB501164_170506_NB501164_thout/accepted_hits.bam ./65_CD8_S16_170415_NB501164_170506_NB501164_thout/accepted_hits.bam
