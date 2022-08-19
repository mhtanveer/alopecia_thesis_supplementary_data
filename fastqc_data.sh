#!/bin/sh

#SBATCH --job-name=fastqc_files

#SBATCH --partition=compute

#SBATCH --account=da494

#SBATCH --mem-per-cpu=8000

#SBATCH --cpus-per-task=10

#SBATCH --time=10:00:00

cd /storage/mhtanvee/data_files

module load bioconda

conda activate project_env

fastqc SRR*

mv *fastqc* /storage/mhtanvee/data_files_fastqc
