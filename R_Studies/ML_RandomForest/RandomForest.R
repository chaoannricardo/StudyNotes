# Read Diabetes Dataset
data <- read.csv("C:/Users/richi/Desktop/Temp/R_Lesson/diabetes.csv")[,-1]
set.seed(102)
select <- sample(1:nrow(data),nrow(data)*0.8)

# Build Random Forest Model
library(randomForest)
set.seed(101)
RF_Model <- randomForest(class ~ ., data=data[select,], ntree=5000)

# Make Predictions for Training Data
RF.Prediction <- predict(RF_Model, data[select,])
accuracy.rf <- sum(RF.Prediction==data[select,]$class)/length(RF.Prediction)
accuracy.rf
table(RF.Prediction, data[select,]$class)

# Make Predictions for Test Data
RF.Prediction <- predict(RF_Model, data[-select,])
accuracy.rf <- sum(RF.Prediction==data[-select,]$class)/length(RF.Prediction)
accuracy.rf
table(RF.Prediction, data[-select,]$class)