#!/bin/bash
#
#SBATCH --job-name=align
#SBATCH --ntasks=6 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=36G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=align.out # File to which STDOUT will be written
#SBATCH --error=align.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=4-00:00:00
#SBATCH --array=1-10

set -e                                                                                  # Error if a single command fails
set -u                                                                                  # Error if un-named variables calledset -x                                                         >

module load conda/latest
conda activate bs

file1=$(ls cleanreads/*.1.fq | sed -n ${SLURM_ARRAY_TASK_ID}p)
file2=$(ls cleanreads/*.2.fq | sed -n ${SLURM_ARRAY_TASK_ID}p)

bismark --bowtie2 -N 1 -L 28 ../Genome/Nomenclature_Update/genome/ -1 $file1 -2 $file2 -o bismarkout/
