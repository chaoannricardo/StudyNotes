# Read Diabetes Dataset
data <- read.csv("C:/Users/richi/Desktop/Temp/R_Lesson/diabetes.csv")[,-1]
set.seed(102)
select <- sample(1:nrow(data),nrow(data)*0.8)

# Build Boosting Model
library(adabag)
set.seed(101)
Boosting_Model <- boosting(class ~ ., data=data[select,]) # 100 trees by default

# Make Predictions for Training Data
Boosting.Prediction <- predict(Boosting_Model, newdata=data[select,])
results <- data.frame(Boosting.Prediction$class, Boosting.Prediction$prob)
names(results) <- c("Prediction", "Negative", "Positive")
results
barplot(Boosting_Model$importance) 

Boosting_Model.Error <- errorevol(Boosting_Model, data[select,])                   #计算全体的误差演变
plot(Boosting_Model.Error$error,type="l",
     main="AdaBoost Error vs Number of Trees") #对误差演变进行画图

Boosting.Prediction$confusion

results <- table(Prediction=Boosting.Prediction$class, Actual=data[select,]$class)
results

Correct_Rate <- sum(diag(results)) / sum(results) 
Correct_Rate

# Make Predictions for Test Data
Boosting.Prediction <- predict(Boosting_Model, newdata=data[-select,])

Boosting.Prediction$confusion

results <- table(Prediction=Boosting.Prediction$class, Actual=data[-select,]$class)
results

Correct_Rate <- sum(diag(results)) / sum(results) 
Correct_Rate