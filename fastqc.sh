#!/bin/bash -l
module load fastqc


for filename in ./*.fastq.gz ;
do
fastqc -o ./1fastqc/  "$filename" ;

done
