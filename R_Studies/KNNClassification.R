# Read Diseases Dataset
data <- read.csv("C:/Users/leeys/Desktop/Desktop/Demo/diseases.csv")
data.y <- data[,c("Diagnosis")]
data.x <- data[,-c(1,7)]
# Data Preprocessing
replacev <- function(x) { 
  x = sub("Yes","1",x)
  x = sub("No","0",x)
  x = as.integer(x)
  return (x)
}
data.x <- as.data.frame(lapply(data.x, replacev))
data <- cbind(data.x, Diagnosis=data.y)

# Generate Training & Test Datasets
set.seed(102)
select <- sample(1:nrow(data),nrow(data)*0.8)
train.x <- data[select,-c(6)]
train.y <- data[select,c("Diagnosis")]
test.x <- data[-select,-c(6)]
test.y <- data[-select,c("Diagnosis")]

# Build KNN Model
library(class)
test.y_hat <- class::knn(train = train.x, test = test.x, 
                         cl=train.y, k=3, prob = T, use.all=F)
attr(test.y_hat,"prob")

# Model Evaluation
accuracy.knn <- sum(test.y_hat==test.y) / length(test.y)
accuracy.knn
agreement_KNN <- test.y_hat == test.y
agreement_KNN
table(test.y_hat, test.y)