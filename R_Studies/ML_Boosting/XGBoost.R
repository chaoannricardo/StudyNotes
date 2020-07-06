#只接受數值性資料
# Read Broadband Dataset
data <- read.csv("C:/Users/richi/Desktop/Temp/R_Lesson/Broadband.csv")[,-1]

# Data Preprocessing
data.y <- data$BROADBAND
data.n <- data[,-c(4,ncol(data))]
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

# Build xgboosting Model  #不接受DataFrame，需做轉換
library(xgboost)

dtrain <- xgb.DMatrix(data = as.matrix(train_set.x), label =  as.matrix(train_set.y))
dtest <- xgb.DMatrix(data = as.matrix(test_set.x))

xgb.params = list(
  #col的抽样比例，越高表示每棵树使用的col越多，会增加每棵小树的复杂度
  colsample_bytree = 0.5,                    
  # row的抽样比例，越高表示每棵树使用的col越多，会增加每棵小树的复杂度
  subsample = 0.5,                      
  booster = "gbtree",
  # 树的最大深度，越高表示模型可以长得越深，模型复杂度越高
  max_depth = 2,           
  # boosting会增加被分错的数据权重，而此参数是让权重不会增加的那么快，因此越大会让模型愈保守
  eta = 0.03,
  # 或用'mae'也可以
  eval_metric = "rmse",                      
  objective = "reg:linear",
  # 越大，模型会越保守，相对的模型复杂度比较低
  gamma = 0)

cv.model = xgb.cv(
  params = xgb.params, 
  data = dtrain,
  nfold = 5,     # 5-fold cv (5折交叉驗證)
  nrounds=200,   # 测试1-100，各个树总数下的模型
  # 如果当nrounds < 30 时，就已经有overfitting情况发生，那表示不用继续tune下去了，可以提早停止                
  early_stopping_rounds = 30, 
  print_every_n = 20 # 每20个单位才显示一次结果，
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








