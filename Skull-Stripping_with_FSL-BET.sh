#!/bin/bash

#### Allocationg Computing Resources ####
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=8GB
#SBATCH --time=01:00:00
#SBATCH --output=/home/anik.das/NC_Analysis/slurm_output_bet_all/output_%j.out

echo "Job Started"

#### Loading FSL Module ####
module load lib/openblas/0.3.5-gnu
module load fsl/6.0.0-bin

#### Loading MRI Scan ####
mri=$mri_dir_path/$mri_name

#### Creating Output File Name ####
first_part=${mri_name::-7}
last_part="_bet.nii.gz"
output_mri_name=$first_part$last_part

echo -e $first_part
echo -e $last_part
echo -e $output_mri_name

#### Performing Brain Extraction aka Skull Stripping Operation (previous threshold=0.4) ####
bet $mri $bet_mri_dir_path/$output_mri_name -R -f 0.4 -g 0

echo "Job Done"

