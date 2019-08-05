# Read breast-cancer Dataset
data <- read.csv("C:/Users/richi/Desktop/Temp/R_Lesson/breast-cancer.csv")

# Generate Training & Test Datasets
set.seed(102)
select <- sample(1:nrow(data),nrow(data)*0.8)
train <- data[select,]
test <- data[-select,]

# Build CART Model without Pruning
library(rpart)
library(rpart.plot)

# minsplit:<樣本數時不做進一步分類；cp:是否砍樹
CART.tree <- rpart(Class ~ ., data=train, 
                   control=rpart.control(minsplit=2, cp=0))
rpart.plot(CART.tree)

# Make Predictions
CART.Prediction <- predict(CART.tree, newdata=test, type='class')

results <- table(Prediction=CART.Prediction, Actual=test$Class)
results

Correct_Rate <- sum(diag(results)) / sum(results) 
Correct_Rate

# Find Suitable cp Value
plotcp(CART.tree)

# Build CART Model with Tree Pruning
CART.tree <- prune(CART.tree, cp=0.07)
rpart.plot(CART.tree)

# Make Predictions
CART.Prediction <- predict(CART.tree, newdata=test, type='class')

results <- table(Prediction=CART.Prediction, Actual=test$Class)
results

Correct_Rate <- sum(diag(results)) / sum(results) 
Correct_Rate








# Build C5.0 Model
library(C50)

C50.tree <- C5.0(Species ~ ., data=train)
summary(C50.tree)
plot(C50.tree)


# Make Predictions
C50.Prediction <- predict(C50.tree, newdata=test, type='class')

as.data.frame(cbind(Prediction=as.character(C50.Prediction), 
                    round(predict(C50.tree, newdata=test, type='prob'),3)))

results <- table(Prediction=C50.Prediction, Actual=test$Species)
results

Correct_Rate <- sum(diag(results)) / sum(results) 
Correct_Rate





