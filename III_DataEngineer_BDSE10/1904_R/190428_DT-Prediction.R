# Read CPU Performance Prediction Dataset
data = read.csv("C:/Users/Student/Desktop/CPU.csv")[,-1]

# Generate Training & Test Datasets
set.seed(112)
select <- sample(1:nrow(data),nrow(data)*0.8)
train <- data[select,]
test <- data[-select,]

# Build Linear Regression Model
LR <- lm(PERF ~ ., data=train)
LR
summary(LR)


# Make Predictions
test_set.y_hat = predict(LR, newdata=test)
test_set.y_hat

# Model Evaluation
mae = sum(abs(test_set.y_hat-test$PERF)) / length(test$PERF)
mae

# Build CART-rpart Model
library(rpart)
library(rpart.plot)

CART.tree <- rpart(PERF ~ ., data=train, 
                   control=rpart.control(minsplit=2, cp=0.001))

rpart.plot(CART.tree)

# Find Suitable cp Value
plotcp(CART.tree)

# Make Predictions
test_set.y_hat <- predict(CART.tree, newdata=test, type='vector')
test_set.y_hat

mae = sum(abs(test_set.y_hat-test$PERF)) / length(test$PERF)
mae

# Build CART-tree Model
library(tree)

CART.tree <- tree(PERF ~ ., data=train)
plot(CART.tree)
text(CART.tree)

test_set.y_hat <- predict(CART.tree, newdata=test, type='vector')
test_set.y_hat

# Model Evaluation
mae = sum(abs(test_set.y_hat-test$PERF)) / length(test$PERF)
mae

# Build Model Tree Model
library(RWeka)

Model.tree <- M5P(PERF ~ ., data=train)
Model.tree
plot(Model.tree)

# Make Predictions
test_set.y_hat <- predict(Model.tree, newdata=test)
test_set.y_hat

# Model Evaluation
mae = sum(abs(test_set.y_hat-test$PERF)) / length(test$PERF)
mae















