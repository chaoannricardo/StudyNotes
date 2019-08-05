# Read Diseases Dataset, eexcept id(column1)
data <- read.csv("C:/Users/richi/Desktop/Temp/R_Lesson/diseases.csv")[,-1]

# Generate Training & Test Datasets
set.seed(102)
select <- sample(1:nrow(data),nrow(data)*0.8)
train <- data[select,]
test <- data[-select,]

# Build Naive Bayes Model with No Laplace Smoothing(No Cleanscing toword 0s)
library(e1071)

View(data)
View(train)
nb_default <- naiveBayes(Diagnosis ~ ., data=train)
test.y_hat <- predict(nb_default, test, type="class")
test.y_hat_prob <- round(predict(nb_default, test, type="raw"),3)

cbind(Prediction=as.character(test.y_hat), test.y_hat_prob)

# Model Evaluation
accuracy.nb_default <- sum(test.y_hat==test$Diagnosis) / length(test$Diagnosis)
accuracy.nb_default
agreement_KNN <- test.y_hat==test$Diagnosis
agreement_KNN

table(test.y_hat, test$Diagnosis, dnn=c("Prediction","Actual"))

nb_default$tables$Sore_Throat

# Build Naive Bayes Model with Laplace Smoothing = 1
library(e1071)

nb_laplace1 <- naiveBayes(Diagnosis ~ ., data=train, laplace=1)
test.y_hat <- predict(nb_laplace1, test, type="class")
test.y_hat_prob <- round(predict(nb_laplace1, test, type="raw"),3)

cbind(Prediction=as.character(test.y_hat), test.y_hat_prob)

# Model Evaluation
accuracy.nb_default <- sum(test.y_hat==test$Diagnosis) / length(test$Diagnosis)
accuracy.nb_default
agreement_KNN <- test.y_hat==test$Diagnosis
agreement_KNN

table(test.y_hat, test$Diagnosis, dnn=c("Prediction","Actual"))

nb_laplace1$tables$Sore_Throat

#======================================================================================

# Read Weather Dataset
data <- read.csv("C:/Users/Student/Desktop/Weather-Numeric.csv")
View(data)

# Generate Training & Test Datasets
set.seed(102)
select <- sample(1:nrow(data),nrow(data)*0.8)
train <- data[select,]
test <- data[-select,]

# Build NB Model with No Laplace Smoothing
library(e1071)

nb_default <- naiveBayes(play ~ ., data=train)
test.y_hat <- predict(nb_default, test, type="class")
test.y_hat_prob <- round(predict(nb_default, test, type="raw"),3)

cbind(Prediction=as.character(test.y_hat), test.y_hat_prob)

# Model Evaluation
accuracy.nb_default <- sum(test.y_hat==test$play) / length(test$play)
accuracy.nb_default
agreement_KNN <- test.y_hat==test$play
agreement_KNN

table(test.y_hat, test$play, dnn=c("Prediction","Actual"))

nb_default$tables$humidity
nb_default$tables$outlook

dnorm(45, mean=37.0, sd=7.69)
dnorm(45, mean=43.5, sd=7.77)

# Build KNN Model with Laplace Smoothing = 1
library(e1071)

nb_laplace1 <- naiveBayes(play ~ ., data=train, laplace=1)
test.y_hat <- predict(nb_laplace1, test, type="class")
test.y_hat_prob <- round(predict(nb_laplace1, test, type="raw"),3)

cbind(Prediction=as.character(test.y_hat), test.y_hat_prob)

# Model Evaluation
accuracy.nb_default <- sum(test.y_hat==test$play) / length(test$play)
accuracy.nb_default
agreement_KNN <- test.y_hat==test$play
agreement_KNN

table(test.y_hat, test$play, dnn=c("Prediction","Actual"))

nb_laplace1$tables$humidity

nb_laplace1$tables$outlook
nb_default$tables$outlook

#===========================================================================

# Read Broadband Dataset
data <- read.csv("C:/Users/Student/Desktop/broadband.csv")[,-1]

for(i in c(1,4,5,12)) {
  data[[i]] <- as.factor(data[[i]])
}

# Generate Training & Test Datasets
set.seed(102)
select <- sample(1:nrow(data),nrow(data)*0.8)
train <- data[select,]
test <- data[-select,]

# Build Naive Bayes Model
library(e1071)

nb_laplace1 <- naiveBayes(BROADBAND ~ ., data=train, laplace=1)
test.y_hat <- predict(nb_laplace1, test, type="class")
test.y_hat_prob <- round(predict(nb_laplace1, test, type="raw"),3)

cbind(Prediction=as.character(test.y_hat), test.y_hat_prob)

# Model Evaluation
accuracy.nb_default <- sum(test.y_hat==test$BROADBAND) / length(test$BROADBAND)
accuracy.nb_default
agreement <- test.y_hat==test$BROADBAND
agreement

table(test.y_hat, test$BROADBAND, dnn=c("Prediction","Actual"))

# Read Broadband Dataset
data <- read.csv("C:/Users/Student/Desktop/broadband.csv")[,-1]
hist(data$ARPB_3M, breaks=50)
skewness(data$ARPB_3M) # Right Skewness










