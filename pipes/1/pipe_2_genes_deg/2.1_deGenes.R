source("https://bioconductor.org/biocLite.R")
biocLite("RCurl")
biocLite("DESeq2")
library("DESeq2")

directory <- "/home/juan/Desktop/juan/bio/mrcv/data/RNASeq.count/"

sampleFiles <- grep("txt",list.files(directory),value=TRUE)
sampleFiles
sampleCondition <- c('C','C','C','C','T','T','T','T')
sampleTable <- data.frame(sampleName = sampleFiles,
                          fileName = sampleFiles,
                          condition = sampleCondition)
sampleTable
treatments = c("C","T")

ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
                                       directory = directory,
                                       design= ~ condition)
colData(ddsHTSeq)$condition <- factor(colData(ddsHTSeq)$condition,
                                      levels = treatments)
dds <- DESeq(ddsHTSeq)
res <- results(dds)

res= subset(res, padj<0.05)
res <- res[order(res$padj),]


# save data results and normalized reads to csv
resdata <- merge(as.data.frame(res), as.data.frame(counts(dds,normalized =TRUE)), by = 'row.names', sort = FALSE)
names(resdata)[1] <- 'gene'
write.csv(resdata, file = "/home/juan/Desktop/juan/bio/mrcv/data/res/DEG-normalized.csv")


