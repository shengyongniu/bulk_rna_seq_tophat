#!/bin/bash -l


module load boost/boost_1_51_0_gnu446
module load cufflinks/2.2.1


cuffdiff -o B_diff_out -b ./genome.fa  -p 8 -L S54,S58,S61,S63  -u ./B_merged_asm/merged.gtf ./54_B_S1_170415_NB501164_170506_NB501164_thout/accepted_hits.bam ./58_B_S5_170415_NB501164_170506_NB501164_thout/accepted_hits.bam  ./61_B_S28_170415_NB501164_170506_NB501164_thout/accepted_hits.bam ./63_B_S12_170415_NB501164_170506_NB501164_thout/accepted_hits.bam

