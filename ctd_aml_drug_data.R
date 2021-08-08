#setting working directory ####
setwd("A:/kiran/beat_aml/CTD_data_beat_aml/BeatAML_Waves1_2")
library(ggplot2)

#reading files####
drg.resp= read.table('OHSU_BeatAMLWaves1_2_Tyner_DrugResponse.txt',
                    header=T, sep='\t')
trt.resp= read.table('OHSU_BeatAMLWaves1_2_Tyner_Sensitive_ResistantCalls.txt',
                     header = F, sep='\t', row.names=1)
trt.resp= t(trt.resp)
colnames(trt.resp)= c('lab_id',colnames(trt.resp)[-1])

#subsetting derug specific data####
head(which(drg.resp$inhibitor== 'Imatinib'), n=5)
imatinib.drg.resp= subset(drg.res, (drg.res[,1]== 'Imatinib') )

#obrtain patient from treatment response data
pt.id= trt.resp[,1]
head(pt.id, n=5)

#filtering patients from imatinib data
pt.id_imtnb= intersect(imatinib.drg.resp$lab_id, pt.id)

which(colnames(trt.resp)== 'Imatinib')
a= c(1,48)
imtnb_trt_rsp= trt.resp[,a]
imtnb_trt_rsp= as.data.frame(imtnb_trt_rsp, stringsAsFactors = T)
plot(imtnb_trt_rsp$Imatinib)

#plotting AUC and IC50
hist(imatinib.drg.resp$auc, main= 'auc for Imatinib treatment accross patients',
     xlab= 'auc values', ylab='Freuency of patients', ylim=c(1,135))

hist(imatinib.drg.resp$ic50, main = 'IC50 for Imatinib treatment accross patients',
     xlab= 'IC50 values', ylab='Freuency of patients', ylim= c(0,400))
