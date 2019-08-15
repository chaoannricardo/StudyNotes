# Read Diseases Dataset, eexcept id(column1)
data <- read.csv("C:/Users/Student/Desktop/diseases.csv")[,-1]

# Generate Training & Test Datasets
set.seed(102)
select <- sample(1:nrow(data),nrow(data)*0.8)
train <- data[select,]
test <- data[-select,]

# Build Naive Bayes Model with No Laplace Smoothing(No Cleanscing toword 0s)
library(e1071)
nb_default <- naiveBayes(type ~ ., data=train)
test.y_hat <- predict(nb_default, test, type="class") 
test.y_hat_prob <- round(predict(nb_default, test, type="raw"),3)

cbind(Prediction=as.character(test.y_hat), test.y_hat_prob)

# Model Evaluation
accuracy.nb_default <- sum(test.y_hat==test$type) / length(test$type)
accuracy.nb_default
agreement_KNN <- test.y_hat==test$type
agreement_KNN

table(test.y_hat, test$type, dnn=c("Prediction","Actual"))


# Build Naive Bayes Model with Laplace Smoothing = 1
library(e1071)

nb_laplace1 <- naiveBayes(type ~ ., data=train, laplace=1)
test.y_hat <- predict(nb_laplace1, test, type="class")
test.y_hat_prob <- round(predict(nb_laplace1, test, type="raw"),3)

cbind(Prediction=as.character(test.y_hat), test.y_hat_prob)

# Model Evaluation
accuracy.nb_default <- sum(test.y_hat==test$type) / length(test$type)
accuracy.nb_default
agreement_KNN <- test.y_hat==test$type
agreement_KNN

table(test.y_hat, test$type, dnn=c("Prediction","Actual"))

