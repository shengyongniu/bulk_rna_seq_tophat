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

- Files: fastqc.sh
- Description:
  - This shell script help us understand the sequencing qualities of each samples and generate well-organized visualization of qualities

3. TopHat

- Files: tophat_mapping_y.sh and tophat_mapping_y.qsub
- Description:
  - These files utilize parallel computation to execute TopHat program. In this script, it will take UCSC hg 38 annotation file to conduct reads mapping with our RNA-seq fastq files.

4. Flagstat
- Files: RNA_flagstat.sh
- Description:
  - This step help us understand more accurate mapping qualities and percentage for double check
  
5. Cufflinks
- Files:
  - cufflinks_assemble.sh
  - cufflinks_assemble.qsub
- Description:
  - Assemble transcripts for each sample
  
6. Create assemblies.txt
- Description: Create a files called assemblies.txt that list the assembly files for samples.

7. CuffMerge
- Files: cuffmerge_y.sh
- Description:
  - Use Cuffmerge to run on all assemblies to create a single merged transcriptome annotation

8. CuffDiff
- Files:
  - B_cuffdiff.sh
  - CD4_cuffdiff.sh
  - CD8_cuffdiff.sh
  - M_cuffdiff.sh
  - cuffdiff_45hr.sh

- Description:
  - Run Cuffdiff by using the merged transcriptome assembly along with the BAM files from TopHat for each replicate in various samples

9. DESeq2
- Description:
  - Use DESeq2 to understand differential expression genes

