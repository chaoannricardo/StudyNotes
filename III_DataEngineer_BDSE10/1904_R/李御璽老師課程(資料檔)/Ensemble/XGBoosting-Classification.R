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
  #col??„æŠ½? ·æ¯”ä?‹ï?Œè?Šé?˜è¡¨ç¤ºæ?æ£µ??‘ä½¿?”¨??„colè¶Šå?šï?Œä?šå?žå? æ?æ£µå°æ?‘ç?„å?æ?‚åº¦
  colsample_bytree = 0.5,                    
  # row??„æŠ½? ·æ¯”ä?‹ï?Œè?Šé?˜è¡¨ç¤ºæ?æ£µ??‘ä½¿?”¨??„colè¶Šå?šï?Œä?šå?žå? æ?æ£µå°æ?‘ç?„å?æ?‚åº¦
  subsample = 0.5,                      
  booster = "gbtree",
  # ??‘ç?„æ?€å¤§æ·±åº¦ï?Œè?Šé?˜è¡¨ç¤ºæ¨¡??‹å¯ä»¥é•¿å¾—è?Šæ·±ï¼Œæ¨¡??‹å?æ?‚åº¦è¶Šé??
  max_depth = 2,           
  # boostingä¼šå?žå? è¢«??†é?™ç?„æ•°?®??ƒé?ï?Œè€Œæ­¤??‚æ•°?˜¯è®©æ?ƒé?ä?ä?šå?žå? ç?„é‚£ä¹ˆå¿«ï¼Œå? æ­¤è¶Šå¤§ä¼šè®©æ¨¡å?‹æ?ˆä?å??
  eta = 0.03,
  # ??–ç”¨'mae'ä¹Ÿå¯ä»?
  eval_metric = "rmse",                      
  objective = "reg:linear",
  # è¶Šå¤§ï¼Œæ¨¡??‹ä?šè?Šä?å?ˆï?Œç›¸å¯¹ç?„æ¨¡??‹å?æ?‚åº¦æ¯”è?ƒä??
  gamma = 0)

cv.model = xgb.cv(
  params = xgb.params, 
  data = dtrain,
  nfold = 5,     # 5-fold cv
  nrounds=200,   # æµ‹è??1-100ï¼Œå?„ä¸ª??‘æ€»æ•°ä¸‹ç?„æ¨¡???
  # å¦‚æ?œå?“nrounds < 30 ?—¶ï¼Œå°±å·²ç?æ?‰overfitting??…å†µ??‘ç?Ÿï?Œé‚£è¡¨ç¤ºä¸ç”¨ç»§ç»­tuneä¸‹åŽ»äº†ï?Œå¯ä»¥æ?æ—©??œæ­¢                
  early_stopping_rounds = 30, 
  print_every_n = 20 # æ¯?20ä¸ªå?•ä?æ?æ˜¾ç¤ºä?€æ¬¡ç?“æ?œï??
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
