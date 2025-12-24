getwd()
setwd('C:/Users/flork/Documents/Studia/Publikacje naukowe/Unsupervised Learning')

library(sf)
library(dplyr)
library(ggplot2)
library(rnaturalearth)
library(rnaturalearthdata)
library(hopkins)
library("factoextra")

leagues <- read.csv('Scrapping/leagues.csv')

head(leagues)
summary(leagues)

summary(factor(leagues$League_tier))

leagues$League_tier <- factor(leagues$League_tier, levels = c("First Tier", "Second Tier"), 
                          labels = c("1st", "2nd"))
summary(leagues)


# First chapter -> clustering only first leagues for each country
leagues_first<-leagues[leagues$League_tier == '1st',]
lf_data <- leagues_first[, c(5,9)]

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
