#!/bin/bash

#### Allocating Computing Resources ####
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=8GB
#SBATCH --time=01:00:00
#SBATCH --output=/home/anik.das/NC_Analysis/slurm_output_reg_all/output_%j.out

echo "Job Started"

#### Loading FSL Module ####
module load lib/openblas/0.3.5-gnu
module load fsl/6.0.0-bin

#### Loading MRI Scan ####
mri=$mri_dir_path/$mri_name

#### Creating Output File Name ####
first_part=${mri_name::-7}
last_part="_reg.nii.gz"
output_mri_name=$first_part$last_part

echo -e $first_part
echo -e $last_part
echo -e $output_mri_name

#### Performing Linear Registration Operation ####
flirt -in $mri -ref /home/anik.das/NC_Analysis/REF_MRI/UNC_Pediatric_4years_Atlas.nii.gz -out $reg_mri_dir_path/$output_mri_name -bins 256 -cost corratio -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -dof 6 -interp trilinear

echo "Job Done"
