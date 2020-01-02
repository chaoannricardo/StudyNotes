# Basic SVM-Classification EXI=================================================
# Read IRIS Dataset
set.seed(102)
select <- sample(1:nrow(iris),nrow(iris)*0.8)
train <- iris[select,]
test <- iris[-select,]

# Build SVM Model
library(e1071)

SVM.Model <- svm(formula = Species ~ ., kernel = "radia", data = train, 
                 probability=TRUE)
summary(SVM.Model)

# Make Predictions
SVM.Prediction <- predict(SVM.Model, test, probability=TRUE)

as.data.frame(cbind(Prediction=as.character(SVM.Prediction), 
                    round(attr(SVM.Prediction,"probabilities"),3)))

# Model Evaluation
results <- table(Prediction=SVM.Prediction, Actual=test$Species)
results

Correct_Rate <- sum(diag(results)) / sum(results) 
Correct_Rate

# Multi-Class Process(顯示投票流程)
SVM.Prediction <- predict(SVM.Model, test, decision.values = TRUE)
as.data.frame(cbind(Prediction=as.character(SVM.Prediction), 
                    attr(SVM.Prediction, "decision.values")))


# Basic SVM-Classification EXII=================================================
library("mlbench")

data(Glass, package="mlbench")

set.seed(516)
select <- sample(1:nrow(Glass),nrow(Glass)*0.8)
train <- Glass[select,]
test <- Glass[-select,]

# Build SVM Model
library(e1071)

SVM.Model <- svm(formula = Type ~ ., kernel = "radia", 
                 cost = 2, data = train, probability=TRUE)
summary(SVM.Model)

SVM.Model$nSV
SVM.Model$tot.nSV

# Make Predictions
SVM.Prediction <- predict(SVM.Model, test, probability=TRUE)

as.data.frame(cbind(Prediction=as.character(SVM.Prediction), 
                    round(attr(SVM.Prediction,"probabilities"),3)))

# Model Evaluation
results <- table(Prediction=SVM.Prediction, Actual=test$Type)
results

Correct_Rate <- sum(diag(results)) / sum(results) 
Correct_Rate

# Multi-Class Process (顯示投票流程)
SVM.Prediction <- predict(SVM.Model, test, decision.values = TRUE)
as.data.frame(cbind(Prediction=as.character(SVM.Prediction), 
                    attr(SVM.Prediction, "decision.values")))[1:5,]














