# Read Diseases Dataset
data <- read.csv("C:/Users/Student/Desktop/sex.csv")

# Generate Training & Test Datasets
set.seed(102)
select <- sample(1:nrow(data),nrow(data)*0.8)
train <- data[select,]
test <- data[-select,]

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