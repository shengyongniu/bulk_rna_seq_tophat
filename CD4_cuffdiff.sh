#!/bin/bash -l


module load boost/boost_1_51_0_gnu446
module load cufflinks/2.2.1


cuffdiff -o CD4_diff_out -b ./genome.fa  -p 8 -L S30,S32,S33,S36,S37,S38,S54,S58,S61,S63,S65  -u ./CD4_merged_asm/merged.gtf ./30_CD4_S22_170415_NB501164_170506_NB501164_thout/accepted_hits.bam ./32_CD4_S23_170415_NB501164_170506_NB501164_thout/accepted_hits.bam ./33_CD4_S24_170415_NB501164_170506_NB501164_thout/accepted_hits.bam ./36_CD4_S25_170415_NB501164_170506_NB501164_thout/accepted_hits.bam ./37_CD4_S26_170415_NB501164_170506_NB501164_thout/accepted_hits.bam ./38_CD4_S27_170415_NB501164_170506_NB501164_thout/accepted_hits.bam ./54_CD4_S3_170415_NB501164_170506_NB501164_thout/accepted_hits.bam ./58_CD4_S7_170415_NB501164_170506_NB501164_thout/accepted_hits.bam ./61_CD4_S10_170415_NB501164_170506_NB501164_thout/accepted_hits.bam ./63_CD4_S13_170415_NB501164_170506_NB501164_thout/accepted_hits.bam ./65_CD4_S15_170415_NB501164_170506_NB501164_thout/accepted_hits.bam  
