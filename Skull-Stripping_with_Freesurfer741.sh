#!/bin/bash

##### Defining Input & Output Directories #####
input_dir="/home/anik/MRI"
output_dir="/home/anik/MRI_freesurfer741_ss"

##### Iterating over Input Directory #####
for file in "$input_dir"/*;
do
	filename=$(basename "$file" .nii.gz)

	mri_watershed -T1 "$file" "$output_dir/$filename"_freesurfer741_ss.nii.gz
done
