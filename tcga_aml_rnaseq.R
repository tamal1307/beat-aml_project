#setting working directory
setwd("A:/kiran/tcga_laml_rnaseq/tcga_laml_rnaseq/")
#load("A:/kiran/tcga_laml_rnaseq/tcga_laml_rnaseq/renv.RData")
y=read.table('tcga_aml_rnaseq.txt', header=T, row.names=1, sep='\t')

#loading ensembl id re replace with gene symbol

#if (!requireNamespace("BiocManager", quietly = TRUE))install.packages("BiocManager")
#BiocManager::install("org.Hs.eg.db")

#library(ComplexHeatmap)
#library(org.Hs.eg.db)

# 1. Convert from ensembl.gene to gene.symbol
#ent_ids= rownames(y)
#geneIDs1 <- ensembldb::select(EnsDb.Hsapiens.v79, 
#keys= cat(a), keytype = "GENEID", 
#columns = c("SYMBOL","GENEID"))

head(ent_ids)
#library("org.Hs.eg.db") # remember to install it if you don't have it already
#symbols <- mapIds(org.Hs.eg.db, 
#keys = cat(paste(shQuote(ent_ids, type="cmd"), collapse=", ")),
#keytype = "ENSEMBL", column="SYMBOL")

head(x)
#require(readxl)####
#library(tidyverse)
#require(data.table)
#opening folders and readinf files
#https://stackoverflow.com/questions/51545792/read-specific-csv-files-in-multiple-directories-with-r?rq=1

file_list <- list.files(path="A:/kiran/tcga_laml_rnaseq/tcga_laml_rnaseq/",
                        recursive = T, pattern = "\\.txt.gz$" )
#$ at the end means that this is end of string. "dbf$" will work too,
# but adding \\.(. is special character in regular expressions so you 
#need to escape it) ensure that you match only files with extension 
#.dbf (in case you have e.g. .adbf files).

data_lst = lapply(file_list,read.table, row.names=1)

y= as.data.frame(data_lst[1], stringsAsFactors = T)

for (i in 2:length(data_lst)){
  y$i= cbind.data.frame(y[,-1],as.data.frame(data_lst[i], stringsAsFactors = T))
}
#write.table(y, 'tcga_aml_rnaseq.txt', sep='\t')

#write.table(ent_ids, 'gene_ids.txt', sep='\t')
#write.table(x, 'newrnaseq.txt', sep='\t')

