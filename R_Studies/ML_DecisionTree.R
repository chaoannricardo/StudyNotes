# ID3======================================================
# 找"資訊獲利"最高的分類法
# Disadvantages of ID3
# 1. Prefer 有很多不同屬性值的Attribute
# 2. 假設所有分類屬性都是有效的(不能像是ID)
# 3. 不能處理連續數值，需先離散化成類別值 & 不允許空值
# 4. 不砍樹，長到100%，會有Overfitting的問題


# CART 分類迴歸樹演算法==========================================
# 找可以使"Gini Index"下降最多的切法，"Gini Gain"最高

# Exmaple 1: breast cancer
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
CART.tree <- prune(CART.tree, cp=0.01)
rpart.plot(CART.tree)

# Make Predictions
CART.Prediction <- predict(CART.tree, newdata=test, type='class')

results <- table(Prediction=CART.Prediction, Actual=test$Class)
results

Correct_Rate <- sum(diag(results)) / sum(results) 
Correct_Rate

# Exmaple 2: Iris
# Extract All Numerical Attributes
# iris2 <- iris[,sapply(iris,is.numeric)]
iris2 <- iris[,-5]

set.seed(1234)
kmeans.result <- kmeans(iris2, 3)
kmeans.result

table(iris$Species, kmeans.result$cluster)

results <- as.matrix(table(iris$Species, kmeans.result$cluster))
results

Correct_Rate <- (sum(results) - sum(colSums(results) - apply(results,2,max))) / 
  sum(results)
Correct_Rate

# Build CART-tree Model
set.seed(102)
select <- sample(1:nrow(iris),nrow(iris)*0.8)
train <- iris[select,]
test <- iris[-select,]

library(tree)

CART.tree <- tree(Species ~ ., data=train)
plot(CART.tree)
text(CART.tree)

CART.Prediction <- predict(CART.tree, newdata=test, type='class')

results <- table(Prediction=CART.Prediction, Actual=test$Species)
results

Correct_Rate <- sum(diag(results)) / sum(results) 
Correct_Rate

# C5.0=======================================================
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


# CHAID 卡方統計量演算法=====================================
# 卡方值越高、P-Value越低，代表該屬性越重要








