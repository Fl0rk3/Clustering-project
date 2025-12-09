getwd()
setwd('C:/Users/flork/Documents/Studia/Publikacje naukowe/Unsupervised Learning')
transfers <- read.csv("transfers.csv")

str(transfers)
summary(factor(transfers$Position))
transfers$Position <- factor(transfers$Position, levels = c("Defender", "Forward", "Goalkeeper", "Midfielder"))

transfers_z <- as.data.frame(lapply(transfers, scale))

