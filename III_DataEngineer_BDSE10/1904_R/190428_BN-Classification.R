# Read Diseases Dataset
data <- read.csv("C:/Users/Student/Desktop/sex.csv")

# Generate Training & Test Datasets
set.seed(102)
select <- sample(1:nrow(data),nrow(data)*0.8)
train <- data[select,]
test <- data[-select,]

# Build Naive Bayes Model
library(bnlearn)

#sex: Target, this function could not tacke 0s issue
nb_default <- naive.bayes(train, training="sex")

plot(nb_default)

test.y_hat <- predict(nb_default, test, prob=FALSE)
test.y_hat_prob <- predict(nb_default, test, prob=TRUE)

nb_default_results <- cbind(Prediction=as.character(test.y_hat), 
                            t(attr(test.y_hat_prob,"prob")))
nb_default_results

# Model Evaluation
accuracy.nb_default <- sum(test.y_hat==test$sex) / length(test$sex)
accuracy.nb_default
agreement_KNN <- test.y_hat==test$sex
agreement_KNN

table(test.y_hat, test$sex, dnn=c("Prediction","Actual"))

# Build Bayes Net Tan Model
library(bnlearn)

bn_default <- tree.bayes(train, training="sex")

plot(bn_default)

test.y_hat <- predict(bn_default, test, prob=FALSE)
test.y_hat_prob <- predict(bn_default, test, prob=TRUE)

bn_default_results <- cbind(Prediction=as.character(test.y_hat), t(as.matrix(attr(test.y_hat_prob,"prob"))))
bn_default_results

# Model Evaluation
accuracy.nb_default <- sum(test.y_hat==test$sex) / length(test$sex)
accuracy.nb_default
agreement_KNN <- test.y_hat==test$sex
agreement_KNN

table(test.y_hat, test$sex, dnn=c("Prediction","Actual"))


#================================================


# Read Broadband Dataset
data <- read.csv("C:/Users/Student/Desktop/broadband.csv")[,-1]

for(i in c(1,4,5,12)) {
  data[[i]] <- as.factor(data[[i]])
}

for(i in c(2,3,6,7,8,9,10,11)) {
  data[[i]] <- cut(data[[i]], breaks=6)
}
View(data)

# Generate Training & Test Datasets
set.seed(102)
select <- sample(1:nrow(data),nrow(data)*0.8)
train <- data[select,]
test <- data[-select,]

# Build Naive Bayes Model
library(bnlearn)

nb_default <- naive.bayes(train, training="BROADBAND")

plot(nb_default)

test.y_hat <- predict(nb_default, test, prob=FALSE)
test.y_hat_prob <- predict(nb_default, test, prob=TRUE)

nb_default_results <- cbind(Prediction=as.character(test.y_hat), t(attr(test.y_hat_prob,"prob")))
nb_default_results

# Model Evaluation
accuracy.nb_default <- sum(test.y_hat==test$BROADBAND) / length(test$BROADBAND)
accuracy.nb_default
agreement_KNN <- test.y_hat==test$BROADBAND
agreement_KNN

table(test.y_hat, test$BROADBAND, dnn=c("Prediction","Actual"))


# Build Bayes Net Tan Model
library(bnlearn)

bn_default <- tree.bayes(train, training="BROADBAND")

plot(bn_default)

test.y_hat <- predict(bn_default, test, prob=FALSE)
test.y_hat_prob <- predict(bn_default, test, prob=TRUE)

bn_default_results <- cbind(Prediction=as.character(test.y_hat), t(as.matrix(attr(test.y_hat_prob,"prob"))))
bn_default_results

# Model Evaluation
accuracy.nb_default <- sum(test.y_hat==test$BROADBAND) / length(test$BROADBAND)
accuracy.nb_default
agreement_KNN <- test.y_hat==test$BROADBAND
agreement_KNN

table(test.y_hat, test$BROADBAND, dnn=c("Prediction","Actual"))














