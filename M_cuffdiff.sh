#!/bin/bash -l


module load boost/boost_1_51_0_gnu446
module load cufflinks/2.2.1


cuffdiff -o M_diff_out -b /restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/Homo_sapiens/UCSC/hg38/Sequence/BowtieIndex/genome.fa  -p 8 -L S54,S58,S61,S63,S65  -u ./M_merged_asm/merged.gtf  ./54_M_S2_170415_NB501164_170506_NB501164_thout/accepted_hits.bam  ./58_M_S6_170415_NB501164_170506_NB501164_thout/accepted_hits.bam  ./61_M_S9_170415_NB501164_170506_NB501164_thout/accepted_hits.bam ./63_M_S29_170415_NB501164_170506_NB501164_thout/accepted_hits.bam  ./65_M_S14_170415_NB501164_170506_NB501164_thout/accepted_hits.bam
