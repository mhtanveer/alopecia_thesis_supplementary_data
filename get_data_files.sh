#!/bin/sh

#SBATCH --job-name=wget_files

#SBATCH --partition=compute

#SBATCH --account=da494

#SBATCH --mem-per-cpu=4000

#SBATCH --cpus-per-task=4

#SBATCH --time=03:00:00

wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR125/065/SRR12513865/SRR12513865_1.fastq.gz

wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR125/065/SRR12513865/SRR12513865_2.fastq.gz

wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR125/066/SRR12513866/SRR12513866_1.fastq.gz

wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR125/066/SRR12513866/SRR12513866_2.fastq.gz

wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR110/028/SRR11067228/SRR11067228_1.fastq.gz

wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR110/028/SRR11067228/SRR11067228_2.fastq.gz

wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR110/029/SRR11067229/SRR11067229_1.fastq.gz

wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR110/029/SRR11067229/SRR11067229_2.fastq.gz
