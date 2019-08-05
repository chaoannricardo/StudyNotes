german <- read.csv("C:/Users/Student/Desktop/german.csv")
head(german,3)

nrow(german)
ncol(german)
length(german)

a <- sapply(german, class)
names(a[1]) # names(a)
a

#Data Cleansing Report
summary(german$duration) # summary(german[3])
sum(is.na(german$duration)) # 计算german$duration中缺失值总数
which(is.na(german$duration)) # 返回缺失值的位置
sum(complete.cases(german)) # 統計數據集中完整樣本的個數
sd(german$duration, na.rm = TRUE)

summary(german$purpose) # summary(german[5])
sum(is.na(german$purpose))

# install.packages('missForest')
# library(missForest) # prodNA() function
# data <- prodNA(german, noNA = 0.1)
# head(data)

length(unique(german$checking_status))
length(unique(german$ID))
length(unique(german$num_dependents))
length(unique(german$installment_commitment))
































