#!/bin/bash
#
#SBATCH --job-name=sort
#SBATCH --ntasks=2 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=60G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=sort.out # File to which STDOUT will be written
#SBATCH --error=sort.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=1-00:00:00
#SBATCH --array=1-10

set -e                                                                                  # Error if a single command fails
set -u                                                                                  # Error if un-named variables calle>set -x

module load samtools

file=$(ls bismarkout/*1_bismark_bt2_pe.bam | sed -n ${SLURM_ARRAY_TASK_ID}p)
name=$(ls bismarkout/*1_bismark_bt2_pe.bam | sed -n ${SLURM_ARRAY_TASK_ID}p | awk -F'[/]' '{print $2}')

samtools sort $file -o bismarkout/sort_$name
