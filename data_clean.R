#clean data here

boston_data <- read.csv("boston_data.csv")
boston_data <- subset(boston_data, boston_data$YEAR == 2018)
boston_data <- boston_data[,-7]

write.csv(boston_data, "./boston_data.csv")

#for 6 specific data
library(dplyr)
offenses = c("Motor Vehicle Accident Response",
             "Drug Violation",
             "Larceny",
             "Aggravated Assault",
             "Auto Theft",
             "Residential Burglary")
new_data = boston_data %>% filter(boston_data$OFFENSE_CODE_GROUP == offenses)

write.csv(new_data, "./topSixCrimes.csv")


