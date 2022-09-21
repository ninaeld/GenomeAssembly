#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=10GB
#SBATCH --time=02:00:00
#SBATCH --job-name=fastqc
#SBATCH --mail-user=nina.eldridge@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --output=/data/users/neldridge/genome_assembly/1_2_kmerCounting_%j.o
#SBATCH --error=/data/users/neldridge/genome_assembly/error_kmerCounting_%j.e
#SBATCH --partition=pcourseassembly

# load module jellyfish
module load UHTS/Analysis/jellyfish/2.3.0;

# define variable for main directory
main_dir=/data/users/neldridge/genome_assembly

# run kmer counting on only one dataset: Illumina (because it has the lowest error rate)
# -m is amount of k mers
# -t is amount of threads
# jellyfish always uses canonical form -> -C is to make sure that the k mers are read canonically
jellyfish count -C -m 21 -s 5G -t 4 <(zcat ${main_dir}/participant_3/Illumina/*.fastq.gz) -o ${main_dir}/1_2_kmerCounting/reads.jf

# save histogram
jellyfish histo -t 4 ${main_dir}/1_2_kmerCounting/reads.jf > ${main_dir}/1_2_kmerCounting/reads.histo

# result link: http://genomescope.org/analysis.php?code=LZDYfrvvMLasU4T9GUmm
