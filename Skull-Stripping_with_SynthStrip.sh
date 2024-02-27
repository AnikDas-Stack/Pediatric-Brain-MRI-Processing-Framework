#!/bin/bash

##### Defining input and output directories #####
input_dir="/home/anik/MRI"
output_dir="/home/anik/MRI_SynthStrip_ss_b1mm"

##### Iterating over input directory & performing mri_synthstrip command using loop #####
for file in "$input_dir"/*;
do
	filename=$(basename "$file" .nii.gz)

	mri_synthstrip -i "$file" -o "$output_dir/$filename"_synthstrip_ss.nii.gz -b 1
done
