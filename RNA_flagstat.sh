#!/bin/bash -l

module load samtools

for file in *_thout/accepted_hits.bam ; do echo "${file}" >> RNA_merge_170415_NB501164_170506_NB501164_flagstat.txt  ;  OUTPUT="$(samtools flagstat $file)" ; echo "${OUTPUT}" >> RNA_merge_170415_NB501164_170506_NB501164_flagstat.txt  ; done
