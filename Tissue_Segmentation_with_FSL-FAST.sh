#!/bin/bash

# Setting the path of main directory
#main_dir="/home/anik/FSL_Tissue_Segmentation/"
main_dir="/home/anik/FSL_Tissue_Segmentation_Artifact/"

# Creating a count variable
count=0

# Running a loop to iterate through each subdirectory
for sub_dir in "$main_dir"*/;
do
	# Extract subdirectory name
	sub_dir_name=$(basename "$sub_dir")

	# Printing the total path
	#echo "$sub_dir""$sub_dir_name"".nii.gz"
	
	# Performing fast command for Tissue Segmentation
	/home/anik/fsl/bin/fast -t 1 -n 3 -H 0.1 -I 4 -l 20.0 -g -o "$sub_dir$sub_dir_name" "$sub_dir$sub_dir_name.nii.gz"

	((count++))
	echo "Count: $count"
done
