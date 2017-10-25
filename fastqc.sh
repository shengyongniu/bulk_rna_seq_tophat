#!/bin/bash -l
module load fastqc


for filename in  /restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/merge_170415_NB501164_170506_NB501164/0raw/*.fastq.gz ;
do
fastqc -o /restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/merge_170415_NB501164_170506_NB501164/1fastqc/  "$filename" ;

done
