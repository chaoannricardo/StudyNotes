# Read Diseases Dataset
data <- read.csv("C:/Users/Student/Desktop/broadband.csv")

data.x = data[,-ncol(data)]
BROADBAND = data[,ncol(data)]

#Flatten "Channel" Column
data.c <- data[,c("CHANNEL")]
data.c <- as.factor(data.c)

library("nnet")
dummy.c <- as.data.frame(class.ind(data.c))
names(dummy.c) <- c("Channel-1", "Channel-2", "Channel-3", "Channel-4")
data <- cbind(data.x, dummy.c)

data <- data[,-c(5)]

#Normalize "Age" Column
AGE <- data[,c("AGE")]
AGE <- (AGE - min(AGE))/(max(AGE) - min(AGE) )

data <- cbind(data, AGE)
data <- data[,-c(3)]

#Normalize "AVG_CALL_LENGTH" Column
AVG_CALL_LENGTH <- data[,c("AVG_CALL_LENGTH")]
AVG_CALL_LENGTH <- (AVG_CALL_LENGTH - min(AVG_CALL_LENGTH))/(max(AVG_CALL_LENGTH) - min(AVG_CALL_LENGTH) )

data <- cbind(data, AVG_CALL_LENGTH)
data <- data[,-c(10)]

#Normalize "DAY_MOU" Column
DAY_MOU <- data[,c("DAY_MOU")]
DAY_MOU <- (DAY_MOU - min(DAY_MOU))/(max(DAY_MOU) - min(DAY_MOU) )

data <- cbind(data, DAY_MOU)
data <- data[,-c(7)]

#Normalize "AFTERNOON_MOU" Column
AFTERNOON_MOU <- data[,c("AFTERNOON_MOU")]
AFTERNOON_MOU <- (AFTERNOON_MOU - min(AFTERNOON_MOU))/(max(AFTERNOON_MOU) - min(AFTERNOON_MOU) )

data <- cbind(data, AFTERNOON_MOU)
data <- data[,-c(7)]

#Normalize "NIGHT_MOU" Column
NIGHT_MOU <- data[,c("NIGHT_MOU")]
NIGHT_MOU <- (NIGHT_MOU - min(NIGHT_MOU))/(max(NIGHT_MOU) - min(NIGHT_MOU) )

data <- cbind(data, NIGHT_MOU)
data <- data[,-c(7)]

#Normalize "CALL_PARTY_CNT" Column
CALL_PARTY_CNT <- data[,c("CALL_PARTY_CNT")]
CALL_PARTY_CNT<- (CALL_PARTY_CNT - min(CALL_PARTY_CNT))/(max(CALL_PARTY_CNT) - min(CALL_PARTY_CNT) )

data <- cbind(data, CALL_PARTY_CNT)
data <- data[,-c(6)]

#Normalize "TENURE" Column
TENURE <- data[,c("TENURE")]
TENURE <- (TENURE - min(TENURE))/(max(TENURE) - min(TENURE) )

data <- cbind(data, TENURE)
data <- data[,-c(3)]

#Normalize "ARPB_3M" Column
ARPB_3M <- data[,c("ARPB_3M")]
ARPB_3M <- (ARPB_3M - min(ARPB_3M))/(max(ARPB_3M) - min(ARPB_3M) )

data <- cbind(data, ARPB_3M)
data <- data[,-c(4)]

#Combine "BROADBAND" back
data <- cbind(data, BROADBAND)

View(data)

# Generate Training & Test Datasets
set.seed(104)
select <- sample(1:nrow(data),nrow(data)*0.8)
train.x <- data[select,-c(16)]
train.y <- data[select,c("BROADBAND")]
test.x <- data[-select,-c(16)]
test.y <- data[-select,c("BROADBAND")]

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










