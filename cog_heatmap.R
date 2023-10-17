library(gplots)
library(superheat)
library(pheatmap)
library(ggplot2)
library(RColorBrewer)

cog<-read.delim("long.tsv")
head(cog)
row.names(cog)<-cog$Assembly
cog<-cog[,-1]
head(cog)
dff <- as.matrix(cog)
head(dff)
#Colors=brewer.pal(11,"Spectral")
Colors=brewer.pal(9,"YlGnBu")
#Colors=c("blue","yellow")
#Colors=colorRampPalette(Colors)(200)

pheatmap(dff, color = Colors, show_rownames = 8, show_colnames = 8)
pheatmap((dff), color = Colors, show_rownames = 4, show_colnames = 4, display_numbers =T, number_format = "%.2f",fontsize_number = 4.5, number_color = "Black",fontsize_row = 7, fontsize_col = 7, cellwidth = 16, cellheight = 11, cluster_rows = FALSE, cluster_cols = FALSE)
pheatmap((dff), color = Colors, show_rownames = 5, show_colnames = 5, display_numbers =T, number_format = "%d",fontsize_number = 7, number_color = "Black",fontsize_row = 7, fontsize_col = 7, cellwidth = 16, cellheight = 11, angle_col = "315",cluster_rows = FALSE, cluster_cols = FALSE)

image=pheatmap((dff), color = Colors, show_rownames = 5, show_colnames = 5, display_numbers =T, number_format = "%d",fontsize_number = 7, number_color = "Black",fontsize_row = 7, fontsize_col = 7, cellwidth = 16, cellheight = 11, angle_col = "315",cluster_rows = FALSE, cluster_cols = FALSE)
ggsave(file="test.svg", plot=image, width=10, height=8)

superheat(X=dff, X.text = round(as.matrix(dff), 1),  X.text.size = 2.1, heat.pal = c("#b35806", "white", "#542788"),bottom.label.text.angle = 90,left.label.text.size = 2.5, bottom.label.text.size = 3, left.label.col = "white", bottom.label.col = "white",legend.vspace = 0.0, scale = TRUE)

#superheat(X=dff, X.text = round(as.matrix(dff), 1),  X.text.size = 2.1, heat.pal = c("#b35806", "white", "#542788"),bottom.label.text.angle = 90,left.label.text.size = 2.5, bottom.label.text.size = 3, left.label.col = "white", bottom.label.col = "white",legend.vspace = 0.0, row.dendrogram = TRUE, col.dendrogram = TRUE)
#heatmap.2((dff),cexCol =0.7,cexRow=1.0,col=Colors,trace = "none",margins = c(5,4),density.info = "none",scale = "none",lhei = c(2,8),lwid=c(2,8),srtCol=90,key = TRUE,key.xlab="COG copy number",key.title =NA)
#heatmap.2(t(dff),cexCol = 1.0,cexRow=1.2,col = heat.colors(256),trace = "none",margins = c(10,12),density.info = "none",scale = "none",lmat=rbind( c(0, 3, 4), c(2,1,1 ) ), lwid=c(1.5, 4, 2.6 ),srtCol=90,key = TRUE,key.xlab="Gene copy number",key.title =NA)
#superheat(X=dff, X.text = round(as.matrix(dff), 1),  X.text.size = 3, heat.pal = c("#b35806", "white", "#542788"), heat.pal.values = c(0, 0.5, 1))
