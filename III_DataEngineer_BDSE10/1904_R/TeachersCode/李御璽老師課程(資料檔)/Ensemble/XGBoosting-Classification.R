# Read Broadband Dataset
data <- read.csv("C:/Users/Spintronics/Downloads/broadband.csv")[,-1]

# Data Preprocessing
data.y <- data$BROADBAND

data.n <- data[,-c(5,ncol(data))]

data.c <- data[,c("CHANNEL")]
data.c <- as.factor(data.c)

library("nnet")

dummy.c = as.data.frame(class.ind(data.c))
names(dummy.c) <- c("Channel-1", "Channel-2", "Channel-3", "Channel-4")

# Generate Training & Test Datasets
set.seed(102)
select <- sample(1:nrow(data),nrow(data)*0.8)

train_set.x <- cbind(data.n[select,], dummy.c[select,])
train_set.y <- data.y[select]
test_set.x <- cbind(data.n[-select,], dummy.c[-select,])
test_set.y <- data.y[-select]

# Build xgboosting Model
library(xgboost)

dtrain <- xgb.DMatrix(data = as.matrix(train_set.x), label =  as.matrix(train_set.y))
dtest <- xgb.DMatrix(data = as.matrix(test_set.x))

xgb.params = list(
  #col??�抽?��比�?��?��?��?�表示�?�棵??�使?��??�col越�?��?��?��?��?��?�棵小�?��?��?��?�度
  colsample_bytree = 0.5,                    
  # row??�抽?��比�?��?��?��?�表示�?�棵??�使?��??�col越�?��?��?��?��?��?�棵小�?��?��?��?�度
  subsample = 0.5,                      
  booster = "gbtree",
  # ??��?��?�大深度�?��?��?�表示模??�可以长得�?�深，模??��?��?�度越�??
  max_depth = 2,           
  # boosting会�?��?�被??��?��?�数?��??��?��?�而此??�数?��让�?��?��?��?��?��?��?�那么快，�?�此越大会让模�?��?��?��??
  eta = 0.03,
  # ??�用'mae'也可�?
  eval_metric = "rmse",                      
  objective = "reg:linear",
  # 越大，模??��?��?��?��?��?�相对�?�模??��?��?�度比�?��??
  gamma = 0)

cv.model = xgb.cv(
  params = xgb.params, 
  data = dtrain,
  nfold = 5,     # 5-fold cv
  nrounds=200,   # 测�??1-100，�?�个??�总数下�?�模???
  # 如�?��?�nrounds < 30 ?��，就已�?��?�overfitting??�况??��?��?�那表示不用继续tune下去了�?�可以�?�早??�止                
  early_stopping_rounds = 30, 
  print_every_n = 20 # �?20个�?��?��?�显示�?�次�?��?��??
)

tmp <- cv.model$evaluation_log

plot(x=1:nrow(tmp), y= tmp$train_rmse_mean, col='red', xlab="nround", ylab="rmse", main="Avg.Performance in CV") 
points(x=1:nrow(tmp), y= tmp$test_rmse_mean, col='blue') 
legend("topright", pch=1, col = c("red", "blue"), 
legend = c("Train", "Validation") )

best.nrounds = cv.model$best_iteration 
best.nrounds

xgb.Model <- xgb.train(paras = xgb.params, data = dtrain, nrounds = best.nrounds) 

# Make Predictions for Training Data
xgb.Prediction <- predict(xgb.Model, dtrain)
xgb.Prediction <- ifelse(xgb.Prediction > 0.01, 1, 0)

accuracy.xgb <- sum(xgb.Prediction==train_set.y)/length(xgb.Prediction)
accuracy.xgb

table(xgb.Prediction, train_set.y)

# Make Predictions for Test Data
xgb.Prediction <- predict(xgb.Model, dtest)
xgb.Prediction <- ifelse(xgb.Prediction > 0.01, 1, 0)

accuracy.xgb <- sum(xgb.Prediction==test_set.y)/length(xgb.Prediction)
accuracy.xgb

table(xgb.Prediction, test_set.y)
