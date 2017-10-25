# bulk_rna_seq_TopHat
A bioinformatic analysis pipeline for bulk RNA-seq
** Our approach refers to a Nature Protocol published in 2012 by Cole Trapnell et. al. **

1. Merge

- Files:
  - merge.sh
  - merge.qsub
- Description:
  - These two files are for merging bulk RNA-seq files from different experiments by multiple threads

2. FastQC

Files: fastqc.sh

This shell script help us understand the sequencing qualities of each samples and generate well-organized visualization of qualities

3. TopHat

tophat_mapping_y.sh and tophat_mapping_y.qsub
These files utilize parallel computation to execute TopHat program. In this script, it will take UCSC hg 38 annotation file to conduct reads mapping with our RNA-seq fastq files.

4. Flagstat

RNA_flagstat.sh

5. Cufflinks

cufflinks_assemble.sh and cufflinks_assemble.qsub

6. Create assemblies.txt

7. CuffMerge

cuffmerge_y.sh

8. CuffDiff

B_cuffdiff.sh, CD4_cuffdiff.sh, CD8_cuffdiff.sh, M_cuffdiff.sh, and cuffdiff_45hr.sh


