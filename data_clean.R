#clean data here

boston_data <- read.csv("boston_data.csv")
boston_data <- subset(boston_data, boston_data$YEAR == 2018)
boston_data <- boston_data[,-7]

write.csv(boston_data, "./boston_data.csv")
