#!/bin/sh

#SBATCH --job-name=STAR_index_setup
#SBATCH --partition=compute
#SBATCH --account=da494
#SBATCH --cpus-per-task=10
#SBATCH --time=12:00:00

INPUT=/storage/mhtanvee/reference_genome



cd ${INPUT}
wget http://ftp.ensembl.org/pub/release-106/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa.gz
wget http://ftp.ensembl.org/pub/release-106/gtf/homo_sapiens/Homo_sapiens.GRCh38.106.gtf.gz


for i in ${INPUT}/*.gz
   do
   gunzip ${i}
done


module purge
module load bioconda

conda activate project_env


STAR --runThreadN ${SLURM_CPUS_PER_TASK} \
--runMode genomeGenerate \
--genomeDir ${INPUT} \
--genomeFastaFiles ${INPUT}/Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa \
--sjdbGTFfile ${INPUT}/Homo_sapiens.GRCh38.106.gtf \
--sjdbOverhang 49 \


for i in ${INPUT}/Homo_sapiens*
   do
   gzip ${i}
done


