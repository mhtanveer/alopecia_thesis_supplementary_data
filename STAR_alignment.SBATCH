#!/bin/sh
#
#SBATCH --job-name=STAR_runs
#SBATCH --account=DA494
#SBATCH --partition=compute
#SBATCH --cpus-per-task=12
#SBATCH --time=08:00:00

module purge
module load bioconda
conda deactivate

conda activate project_env

INPUT=/storage/mhtanvee/fastp_trimmed
OUTPUT=/storage/mhtanvee/done_alignment
REF=/storage/mhtanvee/reference_genome


for r1 in ${INPUT}/*_fastp_trimmed_1.fastq
do
   name=$(basename ${r1} _fastp_trimmed_1.fastq)
   echo $name

   STAR --runThreadN ${SLURM_CPUS_PER_TASK} \
   --genomeDir ${REF} \
   --readFilesIn ${INPUT}/${name}_fastp_trimmed_1.fastq ${INPUT}/${name}_fastp_trimmed_2.fastq \
   --outFileNamePrefix ${OUTPUT}/${name}_ \
   --outSAMtype BAM SortedByCoordinate
done

