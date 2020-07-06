# Read Diseases Dataset
data <- read.csv("F:/李御璽老師課程(資料檔)/diseases.csv")

data.x = data[,-ncol(data)]
data.y = data[,ncol(data)]

# Data Preprocessing
replace = function(x){
  x=sub("Yes","1",x)
  x=sub("No","0",x)
  x=as.integer(x)
  return(x)
}

data.x <-as.data.frame(lapply(data.x,replace))

# Generate Training & Test Datasets
set.seed(102)
select <- sample(1:nrow(data),nrow(data)*0.8)

train_set = cbind(data.x[select,],Diagnosis=data.y[select])
test_set.x = data.x[-select,-1]
test_set.y = data.y[-select]

# Build KNN Model
install.packages("neighbr")
library(neighbr)
fit <- neighbr::knn(train_set=train_set,
                    test_set=test_set.x,
                    k=3,
                    categorical_target="Diagnosis",
                    continuous_target= NULL,
                    comparison_measure="euclidean",
                    return_ranked_neighbors=3,
                    id="Patient_ID")

results <- fit$test_set_scores
results

# Model Evaluation
test_set.y_hat <- fit$test_set_scores$categorical_target
test_set.y_hat

accuracy.knn <- sum(test_set.y_hat==test_set.y)/length(test_set.y)
accuracy.knn

#==================================================================================


# Read Home Prediction Dataset
data = read.csv("F:/李御璽老師課程(資料檔)/home_prediction.csv")

data.id = data[,1]
data.x = data[,-c(1,ncol(data))]
data.y = data[,ncol(data)]


# Data Preprocessing
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}

data.x <- as.data.frame(lapply(data.x, normalize))


# Generate Training & Test Datasets
set.seed(107)
select <- sample(1:nrow(data),nrow(data)*0.8)

train_set = cbind(ID=data.id[select],data.x[select,],Value=data.y[select])
test_set.x = data.x[-select,]
test_set.y = data.y[-select]

# Build KNN Model
library(neighbr)
fit <- neighbr::knn(train_set=train_set,
                    test_set=test_set.x,
                    k=5,
                    categorical_target=NULL,
                    continuous_target= "Value",
                    comparison_measure="euclidean",
                    return_ranked_neighbors=5,
                    id="ID")

results <- fit$test_set_scores
results
test_set.y_hat <- results$continuous_target
test_set.y_hat

# Model Evaluation
mae = sum(abs(test_set.y_hat-test_set.y)) / length(test_set.y)
mae























