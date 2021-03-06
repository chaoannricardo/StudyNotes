# Read Diseases Dataset
data <- read.csv("F:/李御璽老師課程(資料檔)/diseases.csv")
View(data)

data.y <- data[,c("Diagnosis")]
View(data.y)

data.x <- data[,-c(1,7)]
View(data.x)


# Data Preprocessing
replacev <- function(x) { 
  x = sub("Yes","1",x)
  x = sub("No","0",x)
  x = as.integer(x)
  return (x)
}

data.x <- as.data.frame(lapply(data.x, replacev))
data <- cbind(data.x, Diagnosis=data.y)
View(data)

# Generate Training & Test Datasets
set.seed(102)
select <- sample(1:nrow(data),nrow(data)*0.8)
train.x <- data[select,-c(6)]
train.y <- data[select,c("Diagnosis")]
test.x <- data[-select,-c(6)]
test.y <- data[-select,c("Diagnosis")]


# Build KNN Model
#use.all: distance平手時怎麼辦，T:都採用，F:隨機挑最後一個
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


#============================================================================================

# Read InsuPromotion Dataset
data <- read.csv("F:/李御璽老師課程(資料檔)/InsuPromotion.csv")
data.y <- data[,c(5)]
data.x <- data[,-c(5)]
View(data)
View(data.x)
View(data.y)

# Data Preprocessing
replacev <- function(x) { 
  x = sub("20-30K","0",x)
  x = sub("30-40K","0.33",x)
  x = sub("40-50K","0.66",x)
  x = sub("50-60K","1.0",x)
  
  x = sub("20-29","0",x)
  x = sub("30-39","0.33",x)
  x = sub("40-49","0.66",x)
  x = sub("50-59","1.0",x)
  
  x = sub("Yes","1",x)
  x = sub("No","0",x)
  
  x = sub("Male","1",x)
  x = sub("Female","0",x)
  x = as.double(x)
  return (x)
}

data.x <- as.data.frame(lapply(data.x, replacev))
data <- cbind(data.x, InsuPromotion=data.y)
View(data.y)

# Generate Training & Test Datasets
set.seed(104)
select <- sample(1:nrow(data),nrow(data)*0.8)
train.x <- data[select,-c(5)]
train.y <- data[select,c("InsuPromotion")]
test.x <- data[-select,-c(5)]
test.y <- data[-select,c("InsuPromotion")]

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


#============================================================================================

data <- read.csv("F:/李御璽老師課程(資料檔)/broadband.csv")
data.c <- data[,c("CHANNEL")]
data.c <- as.factor(data.c)

library("nnet")

dummy.c <- as.data.frame(class.ind(data.c))
cbind(CHANNEL=data.c,dummy.c)

names(dummy.c) <- c("Channel-1", "Channel-2", "Channel-3", "Channel-4")
dummy.c














































