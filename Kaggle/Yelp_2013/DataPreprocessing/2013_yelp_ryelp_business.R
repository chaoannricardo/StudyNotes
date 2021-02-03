# yelp_training_set_business.json ===============================================
library(tidyverse)
library(jsonlite)
yelp <- stream_in(file("C:/Users/Student/Google_Drive/BDSE10_Project/DataSets/yelp-recsys-2013/yelp_training_set/yelp_training_set/yelp_training_set_business.json"))

business <- yelp

# tackle outliers of "business$review_count"
top <- mean(business$review_count, na.rm = TRUE) + 3 * sd(business$review_count, na.rm = TRUE)
bottom <- mean(business$review_count, na.rm = TRUE) - 3 * sd(business$review_count, na.rm = TRUE)
top  <- floor(top )
bottom <- floor(bottom)
business$review_count[business$review_count < bottom] <- bottom
business$review_count[business$review_count > top] <- top

# Eliminate undifined columns
business <- business[,-2]
business <- business[,-3]
business <- business[,-5]
business <- business[,-5:-6]
business <- business[,-7:-8]

# Data Normalize
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}
business$review_count <- normalize(business$review_count)

# Flatten "business$state"
library("nnet")
flatten = as.data.frame(class.ind(business$state))
colnames(flatten) <- paste("state_", colnames(flatten), sep = "")
business <- cbind(business, flatten)

# Flatten "business$city"
library("nnet")
flatten = as.data.frame(class.ind(business$city))
colnames(flatten) <- paste("city_", colnames(flatten), sep = "")
business <- cbind(business, flatten)

# Deal with "Open" Column
for(i in 1:length(business$open)){
if(business$open[i] == "TRUE"){
  business$open[i] <- "1"
}else{business$open[i] <- "0"}
}

# Delete Unused Column
business <- business[,-3]
business <- business[,-4]

write.table(business,file="C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/training_business_normalized.csv",sep=",",row.names=F, na = "0")

# yelp_test_set_business.json ===============================================
library(tidyverse)
library(jsonlite)
yelp <- stream_in(file("C:/Users/Student/Google_Drive/BDSE10_Project/DataSets/yelp-recsys-2013/yelp_test_set/yelp_test_set/yelp_test_set_business.json"))

business <- yelp

# tackle outliers of "business$review_count"
top <- mean(business$review_count, na.rm = TRUE) + 3 * sd(business$review_count, na.rm = TRUE)
bottom <- mean(business$review_count, na.rm = TRUE) - 3 * sd(business$review_count, na.rm = TRUE)
top  <- floor(top )
bottom <- floor(bottom)
business$review_count[business$review_count < bottom] <- bottom
business$review_count[business$review_count > top] <- top

# Eliminate undifined columns
business <- business[,-3:-4]
business <- business[,-5]
business <- business[,-6]
business <- business[,-6]
business <- business[,-7]

# Data Normalize
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}
business$review_count <- normalize(business$review_count)

# Flatten "business$state"
library("nnet")
flatten = as.data.frame(class.ind(business$state))
colnames(flatten) <- paste("state_", colnames(flatten), sep = "")
business <- cbind(business, flatten)

# Flatten "business$city"
library("nnet")
flatten = as.data.frame(class.ind(business$city))
colnames(flatten) <- paste("city_", colnames(flatten), sep = "")
business <- cbind(business, flatten)

# Deal with "Open" Column
for(i in 1:length(business$open)){
  if(business$open[i] == "TRUE"){
    business$open[i] <- "1"
  }else{business$open[i] <- "0"}
}

# Delete Unused Column
business <- business[,-1]
business <- business[,-4:-5]

View(head(business))

write.table(business,file="C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/Test_business_normalized.csv",sep=",",row.names=F, na = "0")

# yelp_test_set_business.json ===============================================
library(tidyverse)
library(jsonlite)
yelp <- stream_in(file("C:/Users/Student/Google_Drive/BDSE10_Project/DataSets/yelp-recsys-2013/final_test_set/final_test_set/final_test_set_business.json"))

business <- yelp

# tackle outliers of "business$review_count"
top <- mean(business$review_count, na.rm = TRUE) + 3 * sd(business$review_count, na.rm = TRUE)
bottom <- mean(business$review_count, na.rm = TRUE) - 3 * sd(business$review_count, na.rm = TRUE)
top  <- floor(top )
bottom <- floor(bottom)
business$review_count[business$review_count < bottom] <- bottom
business$review_count[business$review_count > top] <- top

# Data Normalize
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}
business$review_count <- normalize(business$review_count)

# Flatten "business$state"
library("nnet")
flatten = as.data.frame(class.ind(business$state))
colnames(flatten) <- paste("state_", colnames(flatten), sep = "")
business <- cbind(business, flatten)

# Flatten "business$city"
library("nnet")
flatten = as.data.frame(class.ind(business$city))
colnames(flatten) <- paste("city_", colnames(flatten), sep = "")
business <- cbind(business, flatten)

# Deal with "Open" Column
for(i in 1:length(business$open)){
  if(business$open[i] == "TRUE"){
    business$open[i] <- "1"
  }else{business$open[i] <- "0"}
}

# Deleted unused columns
business <- business[,-1]
business <- business[,-2]
business <- business[,-2]
business <- business[,-2]
business <- business[,-3]
business <- business[,-4:-5]
business <- business[,-5]
business <- business[,-3]

write.table(business,file="C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/finalTest_business_normalized.csv",sep=",",row.names=F, na = "0")


View(head(business))










