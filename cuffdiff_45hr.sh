#!/bin/bash -l


module load boost/boost_1_51_0_gnu446
module load cufflinks/2.2.1


cuffdiff -o 45hr_diff_out -b ㄡ/genome.fa  -p 8 -L S63,S65,S58,S54,S61  -u ./45hr_merged_asm/merged.gtf  ./63_45hr_S20_170415_NB501164_170506_NB501164_thout/accepted_hits.bam  ./65_45hr_S21_170415_NB501164_170506_NB501164_thout/accepted_hits.bam  ./58_45hr_S18_170415_NB501164_170506_NB501164_thout/accepted_hits.bam ./54_45hr_S17_170415_NB501164_170506_NB501164_thout/accepted_hits.bam  ./61_45hr_S19_170415_NB501164_170506_NB501164_thout/accepted_hits.bam
