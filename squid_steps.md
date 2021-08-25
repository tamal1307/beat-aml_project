#this code needs to be run from the folder where the bam file is located in local computer.
#or 
#in case of remote server, activate the conda environment with squid.

#**Important**

#as a **squid input bam file**, **GENOMIC ALIGNMENT file and CHIMERIC ALIGNMENT FILE of STAR** of the RNAseq alignmnets from TCGA is needed. not the transcriptomic alignment one.

#no need to sort the chimeric bam file

```bash
conda activate environment_with_squid
#sort the genomic alignment bam file with help of samtools using with 8 threads and 4gb per thread
samtools sort -@ 8 -m 4G bam_file.bam -o sorted_bam_file.bam

#the sorted bam file and the chimeric bam file along with the squid qxecution file have to be placed into the same folder for ease of writing the code

#using squid tool
squid -b sorted_bam_file.bam -c chimeric_bam_file.bam -o output_file_of_squid
````
#download the **AnnotateSQUIDOutput.py** file from https://github.com/Kingsford-Group/squid/tree/master/utils
#download the **gtf file** from https://www.gencodegenes.org/human/

```bash
#run the code to obtain annotated fusion gene list
python AnnotateSQUIDOutput.py <gencode.v38.annotation.gtf> <output_file_of_squid> <fusion_gene_list>
```