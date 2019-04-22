# Load libraries
source("https://bioconductor.org/biocLite.R")
#install.packages('gplots')
biocLite("DESeq2")
library("DESeq2")

alpha <- 0.05
setwd(dirname(rstudioapi::getActiveDocumentContext()$path));
getwd()
data_path <- "../../data/ss/all_21/counts.csv"
result_path <- "../../data/ss/all_21/"
# Load data
countdata <- read.table(data_path,header=TRUE,sep="\t")
result_file = paste(result_path,"/counts.21.dat.",alpha,".csv",sep="");

countdata = countdata[countdata$main != 0,]

# I don't know why I have to do this first, otherwise RStudio hangs
countdata <- countdata[!is.na(countdata$Name),]
countdata$Name <- paste(countdata$Name,'_',countdata$Locus)

row.names(countdata) <- countdata$Name
countdata <- subset(countdata, select = -c(main))
countdata <- subset(countdata, select = -c(Name))
countdata <- subset(countdata, select = -c(Locus))
countdata <- as.matrix(countdata)
head(countdata)

# Assign condition (first four are controls, second four contain the expansion)
(condition <- factor(c("control","control","treatment","treatment")))

# Analysis with DESeq2 ----------------------------------------------------

# Create a coldata frame and instantiate the DESeqDataSet. See ?DESeqDataSetFromMatrix
(coldata <- data.frame(row.names=colnames(countdata), condition))
levels(coldata$condition)
coldata
dds <- DESeqDataSetFromMatrix(countData=countdata, colData=coldata, design=~condition)
dds

# Run the DESeq pipeline
dds <- DESeq(dds)

# Get differential expression results
res <- results(dds, alpha=alpha)
#res <- res[res$log2FoldChange >= 1, ]
res <- res[!is.na(res$padj), ]
res <- res[res$padj <= alpha, ]
table(res$padj <= alpha)

## Order by adjusted p-value
res <- res[order(res$padj), ]


## Merge with normalized count data
resdata <- merge(as.data.frame(res), as.data.frame(counts(dds, normalized=TRUE)), by="row.names", sort=FALSE)
names(resdata)[1] <- "Gene"
head(resdata)
## Write results
write.csv(resdata, file=result_file, row.names=FALSE)
result_file

