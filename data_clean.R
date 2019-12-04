#clean data here

boston_data <- read.csv(
  '~/Documents/2019 Fall Classes/Machine Learning/Project 2/boston_data.csv')
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

################
View(new_data)
library(ggplot2)
library(Sleuth3)
library(ISLR)
library(aod)
library(dplyr)
library(tree)
library(randomForest)
library(rpart)
library(caret)
library(party)
library(partykit)
library(rattle)
library(rpart.plot)
library(RColorBrewer)
?tree

new_data = read.csv("./topSixCrimes.csv")


subsdata <- subset(new_data , select = -c(INCIDENT_NUMBER,OFFENSE_CODE,
                                          OFFENSE_DESCRIPTION,OCCURRED_ON_DATE,
                                          UCR_PART,STREET,Lat,Long,Location, ))
head(subsdata)
y <- subsdata$OFFENSE_CODE_GROUP
subsdata$OFFENSE_CODE_GROUP = NULL
subsdata$DISTRICT = NULL

write.csv(subsdata, "./test.csv")
test = read.csv("./test.csv")
newdataa = cbind(y,test)
write.csv(newdataa, "./test.csv")
test = read.csv("./test.csv")
testy = test$y
datatree <- tree(y ~., data = test)
head(subsdata)
head(new_sub)
table(y)
head(test)
plot(datatree)
text(datatree)
?rpart
tree2 <- rpart(y ~ ., data = test)

plot(tree2)
text(tree2, cex = 0.6)
?xgboost

##########################

library(xgboost)
library(tidyverse)
library(caret)
library(DiagrammeR)
library(plm)

View(test)
matdat <- data.matrix(test)
labels <- (test$HOUR)/max(test$HOUR)

bst <- xgboost(data = matdat, label = labels, max_depth = 3, eta = 1, nthread = 2, 
               nrounds = 2, objective = "binary:logistic")
xgb.plot.tree(model = bst)

bst3 <- xgboost(data = matdat, label = (test$X)/length(test$X), max_depth = 3, eta = 1, nthread = 2, 
               nrounds = 1, objective = "binary:logistic")
xgb.plot.tree(model = bst3)
