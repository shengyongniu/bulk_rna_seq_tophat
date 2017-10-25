#!/bin/bash

PROJECT=chengcancer
echo "PROJECT=${PROJECT}"
#JOBNAME=`(basename $0) |  sed -e 's/\.[^.]*$//'` #tophat_mapping_y
JOBNAME='tophat_mapping_0506'
echo "JOBNAME=${JOBNAME}"
NCORE_REQ=4 #based on Charlie's benmark, the increased number of cores above 4 didn't play much in performance gain for tophat,user can experiment this more to set the best value
echo "NCORE_REQ=${NCORE_REQ}"
RT_LIMIT="48:00:00"
MEM_LIMIT="125G" # it seems each job do not consume 10G to my observation; so set 125G shall be safe, even after increase the cores. 
 
FILE_COUNT=`find /restricted/projectnb/chengcancer/Simon/project/T2D/bulk_RNA-seq/merge_170415_NB501164_170506_NB501164/0raw/*_R1_001.fastq.gz | sed 's/_R1_001.fastq.gz$//'| wc -l`
echo "FILE_COUNT=${FILE_COUNT}"

qsub -P $PROJECT -N $JOBNAME -pe omp $NCORE_REQ -l mem_total=${MEM_LIMIT} -l h_rt=${RT_LIMIT} -t 1-${FILE_COUNT} tophat_mapping_y.qsub

