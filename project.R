# A Clustering Analysis of First-Division Football Leagues Based on Structural and Economic Characteristics


getwd()
setwd('C:/Users/flork/Documents/Studia/Stopień II/Semestr I/Unsupervised Learning/Project I')

library(sf)
library(dplyr)
library(ggplot2)
library(rnaturalearth)
library(rnaturalearthdata)
library(cluster)
library(clustertend)
library(hopkins)
library(factoextra)
library(fpc)
library(gridExtra)
library(dendextend)
library(tidyverse)

leagues <- read.csv('Scrapping/leagues_normalized.csv')

head(leagues)
summary(leagues)

#getting clusterable data
l_data <- leagues[, c(5:8)]

# z-score standardization below
l_data_z <- as.data.frame(lapply(l_data, scale))

l_data_matrix <- as.matrix(l_data_z)
set.seed(123)
hopkins_vals <- replicate(50, round(hopkins(l_data_matrix), digits=5))
mean(hopkins_vals)

# K-means
# Finding the optimal number of clusters using elbow method and silhouette method.
plot_wws_kmeans <- fviz_nbclust(l_data_z, kmeans, method = "wss")
plot_silhouette_kmeans <- fviz_nbclust(l_data_z, kmeans, method = "silhouette")
grid.arrange(plot_wws_kmeans, plot_silhouette_kmeans, ncol=2)

kmeans4 <- kmeans(l_data_z, 4)
sil_kmeans4 <- silhouette(kmeans4$cluster, dist(l_data_z))
fviz_silhouette(sil_kmeans4) # 0.29
round(calinhara(l_data_z, kmeans4$cluster), digits = 2) # 68

kmeans3 <- kmeans(l_data_z, 3)
sil_kmeans3 <- silhouette(kmeans3$cluster, dist(l_data_z))
fviz_silhouette(sil_kmeans3) # 0.26
round(calinhara(l_data_z, kmeans3$cluster), digits = 2) # 63.12

fviz_cluster(kmeans4, data = l_data_z, frame = FALSE, geom = "point")

leagues$kmeans_clusters <- kmeans4$cluster

leagues[leagues$kmeans_clusters == 3,]$Country

# PAM method
# Finding the optimal number of clusters using elbow method and silhouette method.
plot_wws_pam <- fviz_nbclust(l_data_z, pam, method = "wss")
plot_silhouette_pam <- fviz_nbclust(l_data_z, pam, method = "silhouette")
grid.arrange(plot_wws_pam, plot_silhouette_pam, ncol=2)

pam8 <- pam(l_data_z, 8)
sil_pam8 <- silhouette(pam8$cluster, dist(l_data_z))
fviz_silhouette(sil_pam8) # 0.26
round(calinhara(l_data_z, pam8$cluster), digits = 2) # 60.64

pam7 <- pam(l_data_z, 7)
sil_pam7 <- silhouette(pam7$cluster, dist(l_data_z))
fviz_silhouette(sil_pam7) # 0.25
round(calinhara(l_data_z, pam7$cluster), digits = 2) # 64.89

pam6 <- pam(l_data_z, 6)
sil_pam6 <- silhouette(pam6$cluster, dist(l_data_z))
fviz_silhouette(sil_pam6) # 0.23
round(calinhara(l_data_z, pam6$cluster), digits = 2) # 62.98

pam5 <- pam(l_data_z, 5)
sil_pam5 <- silhouette(pam5$cluster, dist(l_data_z))
fviz_silhouette(sil_pam5) # 0.26
round(calinhara(l_data_z, pam5$cluster), digits = 2) # 68.74

fviz_cluster(pam5, data = l_data_z, frame = FALSE, geom = "point")

leagues$pam_clusters <- pam5$cluster

leagues[leagues$pam_clusters == 4,]$Country



# Hierarchical Clustering

# find best method
# multiple methods to assess
m <- c( "average", "single", "complete", "ward")
names(m) <- c( "average", "single", "complete", "ward")

ac <- function(x) {
  agnes(l_data_z, method = x)$ac
}

map_dbl(m, ac) # best ward
