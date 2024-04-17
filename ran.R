iris<-read.csv("C:/Users/jagan/Downloads/iris_dataset.csv") 
data(iris) 
head(iris) 
tail(iris) 
str(iris) 
install.packages("caTools") 
library("caTools") 
install.packages("randomForest") 
library("randomForest") 
install.packages("caret") 
library("caret") 
split <- sample.split(iris, SplitRatio = 0.7) 
split 
train <- subset(iris, split == "TRUE") 
test <- subset(iris, split == "FALSE") 
control <- trainControl(method="repeatedcv", number=10, repeats=3) 
seed <- 7 
metric <- "Accuracy" 
set.seed(seed) 
rf <- train(Species~., data=iris, method="rf", metric=metric, tuneLength=15, 
            trControl=control) 
print(rf) 
tunegrid <- expand.grid(.mtry=c(1:4)) 
rf_gridsearch <- train(Species~., data=iris, method="rf", metric=metric, 
                       tuneGrid=tunegrid, trControl=control) 
print(rf_gridsearch) 
plot(rf_gridsearch)

