#!/bin/bash
#
#SBATCH --job-name=trim
#SBATCH --ntasks=12 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=36G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=trim.out # File to which STDOUT will be written
#SBATCH --error=trim.err #  File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=3-00:00:00

module load trimmomatic

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_01/Sample_01_FKDN230521081-1A_HJHC5DSXC_L1_1.fq.gz rawreads/Sample_01/Sample_01_FKDN230521081-1A_HJHC5DSXC_L1_2.fq.gz -baseout cleanreads/S1_L1_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_01/Sample_01_FKDN230521081-1A_HJJ3WDSXC_L3_1.fq.gz rawreads/Sample_01/Sample_01_FKDN230521081-1A_HJJ3WDSXC_L3_2.fq.gz -baseout cleanreads/S1_L3_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_01/Sample_01_FKDN230521081-1A_HJFKYDSXC_L4_1.fq rawreads/Sample_01/Sample_01_FKDN230521081-1A_HJFKYDSXC_L4_2.fq.gz -baseout cleanreads/S1_L4_1_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_01/Sample_01_FKDN230521081-1A_HJFM7DSXC_L4_1.fq.gz rawreads/Sample_01/Sample_01_FKDN230521081-1A_HJFM7DSXC_L4_2.fq.gz -baseout cleanreads/S1_L4_2_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_02/Sample_02_FKDN230521082-1A_HJHC5DSXC_L1_1.fq.gz rawreads/Sample_02/Sample_02_FKDN230521082-1A_HJHC5DSXC_L1_2.fq.gz -baseout cleanreads/S2_L1_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_02/Sample_02_FKDN230521082-1A_HJJ3WDSXC_L3_1.fq.gz rawreads/Sample_02/Sample_02_FKDN230521082-1A_HJJ3WDSXC_L3_2.fq.gz -baseout cleanreads/S2_L3_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_02/Sample_02_FKDN230521082-1A_HJFKYDSXC_L4_1.fq.gz rawreads/Sample_02/Sample_02_FKDN230521082-1A_HJFKYDSXC_L4_2.fq.gz -baseout cleanreads/S2_L4_1_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_02/Sample_02_FKDN230521082-1A_HJFM7DSXC_L4_1.fq.gz rawreads/Sample_02/Sample_02_FKDN230521082-1A_HJFM7DSXC_L4_2.fq.gz -baseout cleanreads/S2_L4_2_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/S3/S3_FKDN240125621-1A_HJHC5DSXC_L1_1.fq.gz rawreads/S3/S3_FKDN240125621-1A_HJHC5DSXC_L1_2.fq.gz -baseout cleanreads/S3_L1_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/S3/S3_FKDN240125621-1A_HJFM7DSXC_L4_1.fq.gz rawreads/S3/S3_FKDN240125621-1A_HJFM7DSXC_L4_2.fq.gz -baseout cleanreads/S3_L4_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_04/Sample_04_FKDN230521084-1A_HJHC5DSXC_L1_1.fq.gz rawreads/Sample_04/Sample_04_FKDN230521084-1A_HJHC5DSXC_L1_2.fq.gz -baseout cleanreads/S4_L1_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_04/Sample_04_FKDN230521084-1A_HJJ3WDSXC_L3_1.fq.gz rawreads/Sample_04/Sample_04_FKDN230521084-1A_HJJ3WDSXC_L3_2.fq.gz -baseout cleanreads/S4_L3_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_04/Sample_04_FKDN230521084-1A_HJFKYDSXC_L4_1.fq.gz rawreads/Sample_04/Sample_04_FKDN230521084-1A_HJFKYDSXC_L4_2.fq.gz -baseout cleanreads/S4_L4_1_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_04/Sample_04_FKDN230521084-1A_HJFM7DSXC_L4_1.fq.gz rawreads/Sample_04/Sample_04_FKDN230521084-1A_HJFM7DSXC_L4_2.fq.gz -baseout cleanreads/S4_L4_2_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_05/Sample_05_FKDN230521085-1A_HJHC5DSXC_L1_1.fq.gz rawreads/Sample_05/Sample_05_FKDN230521085-1A_HJHC5DSXC_L1_2.fq.gz -baseout cleanreads/S5_L1_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_05/Sample_05_FKDN230521085-1A_HJJ3WDSXC_L3_1.fq.gz rawreads/Sample_05/Sample_05_FKDN230521085-1A_HJJ3WDSXC_L3_2.fq.gz -baseout cleanreads/S5_L3_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_05/Sample_05_FKDN230521085-1A_HJFM7DSXC_L4_1.fq.gz rawreads/Sample_05/Sample_05_FKDN230521085-1A_HJFM7DSXC_L4_2.fq.gz -baseout cleanreads/S5_L4_1_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_05/Sample_05_FKDN230521085-1A_HJHFGDSXC_L4_1.fq.gz rawreads/Sample_05/Sample_05_FKDN230521085-1A_HJHFGDSXC_L4_2.fq.gz -baseout cleanreads/S5_L4_2_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_06/Sample_06_FKDN230521086-1A_HJHC5DSXC_L1_1.fq.gz rawreads/Sample_06/Sample_06_FKDN230521086-1A_HJHC5DSXC_L1_2.fq.gz -baseout cleanreads/S6_L1_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_06/Sample_06_FKDN230521086-1A_HJFM7DSXC_L4_1.fq.gz rawreads/Sample_06/Sample_06_FKDN230521086-1A_HJFM7DSXC_L4_2.fq.gz -baseout cleanreads/S6_L4_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_07/Sample_07_FKDN230521087-1A_HJHC5DSXC_L1_1.fq.gz rawreads/Sample_07/Sample_07_FKDN230521087-1A_HJHC5DSXC_L1_2.fq.gz -baseout cleanreads/S7_L1_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_07/Sample_07_FKDN230521087-1A_HJFM7DSXC_L4_1.fq.gz rawreads/Sample_07/Sample_07_FKDN230521087-1A_HJFM7DSXC_L4_2.fq.gz -baseout cleanreads/S7_L4_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_08/Sample_08_FKDN230521088-1A_HJHC5DSXC_L1_1.fq.gz rawreads/Sample_08/Sample_08_FKDN230521088-1A_HJHC5DSXC_L1_2.fq.gz -baseout cleanreads/S8_L1_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_08/Sample_08_FKDN230521088-1A_HJFM7DSXC_L4_1.fq.gz rawreads/Sample_08/Sample_08_FKDN230521088-1A_HJFM7DSXC_L4_2.fq.gz -baseout cleanreads/S8_L4_1_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_08/Sample_08_FKDN230521088-1A_HJHFGDSXC_L4_1.fq.gz rawreads/Sample_08/Sample_08_FKDN230521088-1A_HJHFGDSXC_L4_2.fq.gz -baseout cleanreads/S8_L4_2_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_09/Sample_09_FKDN230521089-1A_HJHC5DSXC_L1_1.fq.gz rawreads/Sample_09/Sample_09_FKDN230521089-1A_HJHC5DSXC_L1_2.fq.gz -baseout cleanreads/S9_L1_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_09/Sample_09_FKDN230521089-1A_HJFM7DSXC_L3_1.fq.gz rawreads/Sample_09/Sample_09_FKDN230521089-1A_HJFM7DSXC_L3_2.fq.gz -baseout cleanreads/S9_L3_1_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_09/ Sample_09_FKDN230521089-1A_HJJ3WDSXC_L3_1.fq.gz rawreads/Sample_09/Sample_09_FKDN230521089-1A_HJJ3WDSXC_L3_2.fq.gz -baseout cleanreads/S9_L3_2_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/Sample_09/Sample_09_FKDN230521089-1A_HJHFGDSXC_L4_1.fq.gz rawreads/Sample_09/Sample_09_FKDN230521089-1A_HJHFGDSXC_L4_2.fq.gz -baseout cleanreads/S9_L4_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/S10/S10_FKDN240003470-1A_HJHC5DSXC_L2_1.fq.gz rawreads/S10/S10_FKDN240003470-1A_HJHC5DSXC_L2_2.fq.gz -baseout cleanreads/S10_L1_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15

trimmomatic PE -trimlog trimlog.txt rawreads/S10/S10_FKDN240003470-1A_HJFM7DSXC_L4_1.fq.gz rawreads/S10/S10_FKDN240003470-1A_HJFM7DSXC_L4_2.fq.gz -baseout cleanreads/S10_L4_clean ILLUMINACLIP:adapters.fa:2:30:10 MINLEN:15
