#!/bin/sh

#SBATCH --job-name=my_featurecounts
#SBATCH --partition=compute
#SBATCH --account=da494
#SBATCH --cpus-per-task=10
#SBATCH --time=10:00:00

module load bioconda
conda activate project_env

featureCounts -T ${SLURM_CPUS_PER_TASK} -a /storage/mhtanvee/reference_genome/Homo_sapiens.GRCh38.106.gtf -o /storage/mhtanvee/counts/count.txt -p /storage/mhtanvee/done_alignment/*_Aligned.sortedByCoord.out.bam

