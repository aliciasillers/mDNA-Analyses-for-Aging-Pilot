#!/bin/bash
#
#SBATCH --job-name=index
#SBATCH --ntasks=10 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=30G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=index.out # File to which STDOUT will be written
#SBATCH --error=index.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=1-00:00:00

set -e                                                                                  # Error if a single command fails
set -u                                                                                  # Error if un-named variables calledset -x  >
module load conda/latest
conda activate bs

bismark_genome_preparation --verbose ../Genome/Nomenclature_Update/genome/