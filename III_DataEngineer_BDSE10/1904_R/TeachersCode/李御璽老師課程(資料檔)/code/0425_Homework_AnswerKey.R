data <- read.csv("C:\Users\Student\Desktop\broadband.csv")

# Data Preprocessing
data.i <- data[,1]

data.y <- data[,ncol(data)]
data.y <- as.factor(data.y)

data.n <- data[,-c(1,5,ncol(data))]

normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}

data.n <- as.data.frame(lapply(data.n, normalize))

data.c <- data[,c("CHANNEL")]
data.c <- as.factor(data.c)

library("nnet")

dummy.c = as.data.frame(class.ind(data.c))
names(dummy.c) <- c("Channel-1", "Channel-2", "Channel-3", "Channel-4")

# Generate Training & Test Datasets
set.seed(102)
select <- sample(1:nrow(data),nrow(data)*0.8)

train_set = cbind(CUST_ID=data.i[select], data.n[select,], 
                  dummy.c[select,], BROADBAND=data.y[select])
test_set.x = cbind(data.n[-select,], dummy.c[-select,])
test_set.y = data.y[-select]

# Build KNN Model
library(neighbr)
fit <- neighbr::knn(train_set=train_set,
           test_set=test_set.x,
           k=3,
           categorical_target="BROADBAND",
           continuous_target= NULL,
           comparison_measure="euclidean",
           return_ranked_neighbors=3,
           id="CUST_ID")

results <- fit$test_set_scores
results

# Model Evaluation
test_set.y_hat <- fit$test_set_scores$categorical_target

accuracy.knn <- sum(test_set.y_hat==test_set.y)/length(test_set.y)
accuracy.knn

table(test_set.y_hat, test_set.y)
