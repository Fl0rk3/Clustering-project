getwd()
setwd('C:/Users/flork/Documents/Studia/Publikacje naukowe/Unsupervised Learning')

library(sf)
library(dplyr)
library(ggplot2)
library(rnaturalearth)
library(rnaturalearthdata)
library(hopkins)
library("factoextra")

leagues <- read.csv('Scrapping/leagues_normalized.csv')

head(leagues)
summary(leagues)

summary(leagues)


# First chapter -> clustering only first leagues for each country
leagues_first<-leagues[leagues$League_tier == 1,]
lf_data <- leagues_first[, c(5:8)]

# z-score standardization below
lf_data_z <- as.data.frame(lapply(lf_data, scale))

# hopkins 1 XD
lf_data_matrix <- as.matrix(lf_data_z)
set.seed(123)
hopkins_stat <- round(hopkins(lf_data_matrix), digits=2)
print(hopkins_stat)


# Finding the optimal number of clusters using elbow method and silhouette method.
fviz_nbclust(lf_data_z, kmeans, method = "wss")
fviz_nbclust(lf_data_z, kmeans, method = "silhouette")

# Second chapter -> clustering all leagues
l_data <- leagues[, c(5:8)]
l_data_z <- as.data.frame(lapply(l_data, scale))

fviz_nbclust(l_data_z, kmeans, method = "wss")
fviz_nbclust(l_data_z, kmeans, method = "silhouette")
