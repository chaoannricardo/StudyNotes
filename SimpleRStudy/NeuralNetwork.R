# NN Classification===========================================
# Data Preprocessing for NN
zoo <- read.csv("C:/Users/richi/Desktop/Temp/R_Lesson/zoo.csv",header=T,sep=",")

kzoo <- zoo[,-c(1,18)]

# Levels
as.numeric(kzoo$hair)
as.numeric(kzoo$hair)-1

convert <- function(v) {
  as.numeric(v)-1
}

kzoo <- as.data.frame(sapply(kzoo,convert))

library(nnet)
kzoo <- as.data.frame(cbind(kzoo, class.ind(zoo$type)))

# Generate Training & Test Datasets
set.seed(102)
select <- sample(1:nrow(kzoo),nrow(kzoo)*0.8)
train <- kzoo[select,]
test <- kzoo[-select,]

test.y <- zoo[-select,18]

# Build BP Neural Network Model
library(neuralnet)

bpn <- neuralnet(formula = "amphibian+bird+fish+insect+invertebrate+mammal+reptile ~ hair+feathers+eggs+milk+airborne+aquatic+predator+toothed+backbone+breathes+venomous+fins+legs+tail+domestic+catsize", 
                 data = train,
                 hidden = c(8),       # 一個隱藏層：8個node
                 learningrate = 0.01, # learning rate
                 threshold = 0.001,    # partial derivatives of the error function, a stopping criteria
                 stepmax = 5e5        # 最大的ieration數 = 500000(5*10^5)
)

# bpn模型會長得像這樣
plot(bpn)

# 預測結果
#1:16 輸入資料
pred <- compute(bpn, test[,1:16])
pred.result <- as.data.frame(round(pred$net.result))
names(pred.result) <- c("amphibian","bird","fish","insect","invertebrate","mammal","reptile")

for(i in 1:nrow(pred.result)){
  if(pred.result[i, 1]==1){ pred.result[i, "type"] <- "amphibian"}
  else if(pred.result[i, 2]==1){ pred.result[i, "type"] <- "bird"}
  else if(pred.result[i, 3]==1){ pred.result[i, "type"] <- "fish"}
  else if(pred.result[i, 4]==1){ pred.result[i, "type"] <- "insect"}
  else if(pred.result[i, 5]==1){ pred.result[i, "type"] <- "invertebrate"}
  else if(pred.result[i, 6]==1){ pred.result[i, "type"] <- "mammal"}
  else { pred.result[i, "type"] <- "reptile"}
}

accuracy.nn <- sum(pred.result$type==test.y)/length(test.y)
accuracy.nn

table(Prediction=pred.result$type, Acctual=test.y)

