# Read CSV
data <- read.csv("C:/Users/richi/Desktop/Temp/R_Lesson/zoo.csv")
head(data,3)

# Read JSON
library(jsonlite)
library(tidyverse)
business <- stream_in(file("C:/Users/richi/Google_Drive/BDSE10_Project/DataSets/yelp_dataset/business.json"))

# Write CSV
write.table(business,file="C:/Users/richi/Desktop/business_StateReviewcounts.csv",sep=",",row.names=F, na = "NA")

# Data's Basic Information
summary(zoo)
nrow(zoo)
ncol(zoo)
length(zoo)

# Data's class
a <- sapply(data, class)
names(a[1]) # names(a)
View(a)

# Change Data's Class
data[14] <- as.factor(data[14])

# Flatten 
library("nnet")
flatten = as.data.frame(class.ind(business$state))

# Paste
colnames(flatten) <- paste("state-", colnames(flatten), sep = "")

# Tackle Outliers==========================================================
age_lb <- mean(german$age, na.rm = TRUE) - 3 * sd(german$age, na.rm = TRUE)
age_ub <- mean(german$age, na.rm = TRUE) + 3 * sd(german$age, na.rm = TRUE)
age_lb <- floor(age_lb)
age_ub <- floor(age_ub)
temp <- german
german$age[german$age < age_lb] <- age_lb
german$age[german$age > age_ub] <- age_ub
summary(german$age)

# Normalize==========================================================
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}
data.x <- as.data.frame(lapply(data.x, normalize))



