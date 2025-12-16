getwd()
setwd('C:/Users/flork/Documents/Studia/Publikacje naukowe/Unsupervised Learning')

leagues <- read.csv('Scrapping/leagues.csv')

install.packages('rgeoboundaries')
library(sf)
library(dplyr)
library(ggplot2)
library(rnaturalearth)
library(rnaturalearthhires)
library(rgeoboundaries)

leagues_by_country <- leagues |>
  count(Country, name = "n_leagues")   # change Country if your column is named differently

home_vec <- c("England", "Scotland", "Wales", "Northern Ireland")