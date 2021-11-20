import os
import pandas
import subprocess

base_path = f'{os.getcwd()}/patient_folders'
metadata = pandas.read_csv('id_file', sep='\t')
for i in metadata.index:
	folder_name = metadata['File_ID'][i]
	if(os.path.isdir(folder_name)):
			new_folder = os.path.join(base_path, str(metadata['Case_ID'][i]))
			os.makedirs(new_folder, exist_ok = True)
			subprocess.run(f'cp -r {folder_name}/* {new_folder}', shell = True)
			print(f'{i}/{len(metadata)}')