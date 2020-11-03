#!/bin/sh

# Go to where the files are located


#Directory Path from where the contents have to be copied
result = 0;
folders=$(ls)
path=$(pwd)

for folder in ${folders[@]}; do
	cd ./$folder/Script
	script_path=$(pwd)
	echo "pwd of script is" $script_path	
	script_file=$(ls)
	echo " Script folder Contents are " $script_file
	cd ..

	cd ./DataSet
	dataSet_path=$(pwd)
	echo "pwd of data set is" $dataSet_path	
	data_file=$(ls)
	echo " Script folder Caontents are " $data_file
	cd ..
	
	echo " Starting for loop inside folder " $folder
	for file in ${script_file[@]}; do
		echo "Script Name is : " $file
		for dataFile in ${data_file[@]}; do
			echo "Data File Name is : " $dataFile
			newman run $script_path/$file -d $dataSet_path/$dataFile -r htmlextra --reporter-htmlextra-export ./$results/report.html
		done	
	done
done
