# Read Diabetes Dataset
data <- read.csv("C:/Users/richi/Desktop/Temp/R_Lesson/diabetes.csv")[,-1]
set.seed(102)
select <- sample(1:nrow(data),nrow(data)*0.8)

# Build Bagging Model
library(adabag)
set.seed(101)
Bagging_Model <- bagging(class ~ ., data=data[select,],  mfinal = 100)

# Make Predictions for Training Data
Bagging.Prediction <- predict(Bagging_Model, newdata=data[select,])
results <- data.frame(Bagging.Prediction$class, Bagging.Prediction$prob)
names(results) <- c("Prediction", "Negative", "Positive")
results
barplot(Bagging_Model$importance) 
Bagging.Prediction$confusion
results <- table(Prediction=Bagging.Prediction$class, Actual=data[select,]$class)
results
Correct_Rate <- sum(diag(results)) / sum(results) 
Correct_Rate

# Make Predictions for Test Data
Bagging.Prediction <- predict(Bagging_Model, newdata=data[-select,])
Bagging.Prediction$confusion
results <- table(Prediction=Bagging.Prediction$class, Actual=data[-select,]$class)
results
Correct_Rate <- sum(diag(results)) / sum(results) 
Correct_Rate













