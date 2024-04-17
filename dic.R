install.packages('dplyr') 
library(dplyr) 
install.packages('caret') 
library(caret) 
install.packages('ggplot2') 
library(ggplot2) 
install.packages('rpart.plot') 
library(rpart.plot) 
titanic<-read.csv("C:/Users/jagan/Downloads/titanic.csv") 
head(titanic) 
tail(titanic) 
titanic = dplyr::select(titanic,Survived,Pclass,Sex,SibSp,Parch) 
titanic=na.omit(titanic) 
str(titanic) 
titanic$Survived = factor(titanic$Survived) 
titanic$Pclass = factor(titanic$Pclass, order=TRUE, levels = c(3, 2, 1)) 
ggplot(titanic,aes(x = Survived))+ 
  geom_bar(width=0.5, fill = "coral") + 
  geom_text(stat='count', aes(label=stat(count)), vjust=-0.5) + 
  theme_classic() 
train_test_split = function(data, fraction = 0.8, train = TRUE) { 
  total_rows = nrow(data) 
  train_rows = fraction * total_rows 
  sample = 1:train_rows 
  if (train == TRUE) { 
    return (data[sample, ]) 
  } else { 
    return (data[-sample, ]) 
  } 
} 
train <- train_test_split(titanic, 0.8, train = TRUE) 
test <- train_test_split(titanic, 0.8, train = FALSE) 
fit <- rpart(Survived~., data = train, method ='class') 
rpart.plot(fit, extra = 106) 
View(titanic) 
predicted = predict(fit, test, type = 'class') 
table = table(test$Survived, predicted) 
table 
accuracy_Test <- sum(diag(table)) / sum(table) 
print(paste('Accuracy for test', accuracy_Test)) 
accuracy_tune <- function(fit) { 
  predict_unseen <- predict(fit, data_test, type = 'class') 
  table_mat <- table(data_test$Survived, predict_unseen) 
  accuracy_Test <- sum(diag(table_mat)) / sum(table_mat) 
  accuracy_Test 
} 
control <- rpart.control(minsplit = 4, 
                         minbucket = round(5 / 3), 
                         maxdepth = 3, 
                         cp = 0) 
tune_fit <- rpart(Survived~., data = train, method = 'class', control = control) 
dt_predict = predict(tune_fit, test, type = 'class') 
table_mat = table(test$Survived, dt_predict) 
dt_accuracy_2 = sum(diag(table_mat)) / sum(table_mat) 
paste("The accuracy is : ", dt_accuracy_2)

