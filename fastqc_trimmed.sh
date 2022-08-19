#!/bin/sh

#SBATCH --job-name=fastqc_trimmed
#SBATCH --partition=compute
#SBATCH --account=da494
#SBATCH --mem-per-cpu=8000
#SBATCH --cpus-per-task=10
#SBATCH --time=10:00:00

cd /storage/mhtanvee/fastp_trimmed
module load bioconda
conda activate project_env
fastqc SRR*
mv *fastqc* /storage/mhtanvee/fastp_trimmed_qc

