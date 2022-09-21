#!/usr/bin/env bash

#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=4000M
#SBATCH --time=01:00:00
#SBATCH --job-name=fastqc
#SBATCH --mail-user=nina.eldridge@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --output=/data/users/neldridge/genome_assembly/1_fastqc_%j.o
#SBATCH --error=/data/users/neldridge/genome_assembly/error_fastqc_%j.e
#SBATCH --partition=pcourseassembly

# first the fastQC module has to be loaded
module add UHTS/Quality_control/fastqc/0.11.9;

# define variable for main directory
main_dir=/data/users/neldridge/genome_assembly

# run fastqc for Illumina reads
fastqc -o ${main_dir}/1_fastqc/Illumina/ ${main_dir}/participant_3/Illumina/*.fastq.gz

# run fastqc for pacbio reads
fastqc -o ${main_dir}/1_fastqc/pacbio/ ${main_dir}/participant_3/pacbio/*.fastq.gz

# run fastqc for RNAseq reads
fastqc -o ${main_dir}/1_fastqc/RNAseq/ ${main_dir}/participant_3/RNAseq/*.fastq.gz