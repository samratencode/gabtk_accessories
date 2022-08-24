##Loading libraries
library(ggbiplot)
library(ggplot2)
library(GGally)
library(stats)
library(ggfortify)
library(PCAtools)
library(lfda)
library(scatterPlotMatrix)

##Setting up working directory
setwd("/Users/xxxx/Desktop/Benchmarking")

##Reading files
benc_pca= read.delim2("pca_bench.tsv")
head(benc_pca)
label_benc<-benc_pca[1:2]
head(label_benc)

##log2 normalization
log_benc_pca<-log2(benc_pca[3:7])
label_log_benc_pca<-cbind(label_benc,log_benc_pca)
head(log_benc_pca)
head(label_log_benc_pca)

##Scaling
scale_log_benc_pca<-scale(log_benc_pca)
label_scale_log_benc_pca<-cbind(label_benc,scale_log_benc_pca)
head(scale_log_benc_pca)
head(label_scale_log_benc_pca)

##Scatterplot
scatterPlotMatrix(log_benc_pca)
scatterPlotMatrix(scale_log_benc_pca)

##PCA analysis
pc=prcomp(label_log_benc_pca[3:7],center = TRUE,scale. = TRUE)
pc=prcomp(label_scale_log_benc_pca[3:7],center = TRUE,scale. = TRUE)
print(pc)
summary(pc)
plot(pc)
screeplot(pc, type = "line", main = "Scree plot")


##PCA visualization part of ggfortify package
autoplot(pc,data=benc_pca,colour='Group',label=TRUE,loadings = TRUE, loadings.colour ='blue',loadings.label = TRUE, loadings.label.size = 3,frame= TRUE )

##PCA visualization part of ggplot2 package
p <- ggplot(data = pc, aes(x = PC1, y = PC2, color=label_scale_log_benc_pca$Group)) + geom_point()
p

##For correlation
ggpairs(log_benc_pca)
ggpairs(label_scale_log_benc_pca,columns = 3:7,aes(color = Group,alpha = 0.5),upper = list(continuous = wrap("cor", size = 2.5)))
