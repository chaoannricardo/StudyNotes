#Read Data
zoo <- read.csv("C:/Users/richi/Desktop/Temp/R_Lesson/zoo.csv")

#Eliminate "name" column
zoo0 <- zoo[-1]

#Change a[13] into "factor"
zoo0$legs <- as.factor(zoo0$legs)

# Generate Training & Test Datasets
set.seed(102)
select <- sample(1:nrow(zoo),nrow(zoo)*0.8)

train <- zoo0[select,]
test <- zoo0[-select,]

# =========================Naive Bayes Model===============================
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

# =========================Bayes Net Tan Model===============================
# Build Bayes Net Tan Model
library(bnlearn)

bn_default <- tree.bayes(train, training="type")
plot(bn_default)
test.y_hat <- predict(bn_default, test, prob=FALSE)
test.y_hat_prob <- predict(bn_default, test, prob=TRUE)

bn_default_results <- cbind(Prediction=as.character(test.y_hat), t(as.matrix(attr(test.y_hat_prob,"prob"))))
bn_default_results

# Model Evaluation
accuracy.bn_default <- sum(test.y_hat==test$type) / length(test$type)
accuracy.bn_default
agreement_KNN <- test.y_hat==test$type
agreement_KNN

table(test.y_hat, test$type, dnn=c("Prediction","Actual"))













