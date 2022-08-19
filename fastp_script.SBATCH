#!/bin/sh

#SBATCH --job-name=fastp
#SBATCH --partition=compute
#SBATCH --account=da494
#SBATCH --mem-per-cpu=4000
#SBATCH --cpus-per-task=1
#SBATCH --time=6:00:00

module load bioconda
module load jdk
conda activate project_env


INPUT=/storage/mhtanvee/data_files
OUTPUT=/storage/mhtanvee/fastp_trimmed
REPORT=/storage/mhtanvee/fastp_reports

for files in ${INPUT}/*_1.fastq.gz                                                                                                                          do
   name=$(basename ${files} _1.fastq.gz)
   echo $name

   fastp -i ${INPUT}/${name}_1.fastq.gz -I ${INPUT}/${name}_2.fastq.gz -o ${OUTPUT}/${name}_fastp_trimmed_1.fastq.gz -O ${OUTPUT}/${name}_fastp_trimmed_2.fastq.gz -h ${REPORT}/${name}.html

done


