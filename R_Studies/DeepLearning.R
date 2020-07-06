# Basic DNN (Deep Neural Network)======================================
# 数据导入
wd <- "C:/Users/richi/Desktop/Temp/R_Lesson/"

Ad <- paste(wd,'train.csv',sep = '')#训练资料路径
data <- read.csv(Ad)#读取训练资料

sqrt(ncol(data)-1)

library(dplyr)

set.seed(0)
train <- sample_frac(data, 0.8) 
test  <- setdiff(data, train)

# 数据查看
obs.matrix <- matrix(unlist(train[1, -1]), # 忽略label
                     nrow = 28,            
                     byrow=T)


# 第一张图
image(obs.matrix, 
      col=grey.colors(255))

# 由于读入的图是横的，因此写一个翻转的函数
rotate <- function(matrix){
  t(apply(matrix, 2, rev))
} 

# 画出第一~八个图
par(mfrow=c(2,4))

for(x in 11:18){
  obs.matrix <- matrix(unlist(train[x, -1]), # 忽略 'label'
                       nrow = 28,            
                       byrow=T)
  
  image(rotate(obs.matrix),
        col=grey.colors(255),
        xlab=paste("Label", train[x, 1], sep=": "),
        cex.lab = 1.5
  )
}

par(mfrow=c(1,1))

# 数据准备阶段完毕
train.x <- t(train[, -1]/255) # train: 28 x 28 pixels
train.y <- train[, 1]         # train: label
test.x <- t(test[, -1]/255)   # test: 28 x 28 pixels
test.y <- test[, 1]           # test: label

nrow(train.x)
ncol(train.x)

# mxnet安装  
# install.packages("drat", repos="https://cran.rstudio.com")  
# drat:::addRepo("dmlc")  
# install.packages("mxnet")  
# install.packages('DiagrammeR')

# 用以下方式安装
# install.packages("drat", repos="https://cran.rstudio.com")
# drat:::addRepo("dmlc")
# cran <- getOption("repos")
# cran["dmlc"] <- "https://s3-us-west-2.amazonaws.com/apache-mxnet/R/CRAN/"
# options(repos = cran)
# install.packages("https://github.com/jeremiedb/mxnet_winbin/raw/master/mxnet.zip", repos = NULL)

# CNN Model 建制
library(mxnet)

# 输入层
data <- mx.symbol.Variable('data')

# Flatten（全连接层）
flatten <- mx.symbol.Flatten(data=data)

# 建立一個Full-Connected的隐藏层，500节点
fc1 <- mx.symbol.FullyConnected(data=flatten, num_hidden=500, name="1-fc")

# 隐藏层的激发函数：tanh
fc.act1 <- mx.symbol.Activation(data=fc1, act_type="tanh", name="1-fc.act")

# 建立第二個Full-Connected的隐藏层，500节点
fc2 <- mx.symbol.FullyConnected(data=fc.act1, num_hidden=500, name="2-fc")
# 隐藏层的激发函数：tanh
fc.act2 <- mx.symbol.Activation(data=fc2, act_type="tanh", name="2-fc.act")

# 输出层：因為预测数字为0~9共十個，节点数为10个
output <- mx.symbol.FullyConnected(data=fc.act2, num_hidden=10, name="output")

# Transfer the Evidence to Probability by Softmax-function
cnn <- mx.symbol.SoftmaxOutput(data=output, name="cnn")

#CNN
arguments(cnn)

# CNN Model 训练
# train.x和test.x轉換成一個四維矩陣（CNN要求）
train.array <- train.x
dim(train.array) <- c(28, 28, 1, ncol(train.x))
test.array <- test.x
dim(test.array) <- c(28, 28, 1, ncol(test.x))

mx.set.seed(0)

# 训练上述的设计的CNN模型
cnn.model <- mx.model.FeedForward.create(
  cnn,       # 上述的设计的CNN模型
  X=train.array,  # train.x
  y=train.y,  #  train.y
  ctx=mx.cpu(),  # 可以決定使用CPU或GPU: mx.gpu()
  num.round=10,  # iteration round
  array.batch.size=100, # Batch Size
  learning.rate=0.07,   # Learn Rate
  momentum=0.7,         # Momentum  
  eval.metric=mx.metric.accuracy, # 评估预测结果的基准公式
  initializer=mx.init.uniform(0.05), # 初始化參数
  epoch.end.callback=mx.callback.log.train.metric(100)
)

# CNN Model 测试
# test 预测
test.py <- predict(cnn.model, test.array)
test.py <- t(test.py)
test.py.label <- max.col(test.py) - 1

# 结果
# 宏平均F-measure
library(dplyr)

result <- table(test.y,test.py.label)
result

P=0
R=0

for(i in 0:nrow(result)-1)
{
  P = P+ifelse(sum(result[i+1,])!=0,result[i+1,i+1]/sum(result[i+1,]),0) 
  R = R+ifelse(sum(result[,i+1])!=0,result[i+1,i+1]/sum(result[,i+1]),0) 
}

P=P/10
R=R/10

F1 = 2*P*R/(P+R)
F1
















