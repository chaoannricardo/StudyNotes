library(jsonlite)
library(tidyverse)

# read business.json
business <- stream_in(file("C:/Users/richi/Google_Drive/BDSE10_Project/DataSets/yelp_dataset/business.json"))

# tackle outliers of "business$review_count"
top <- mean(business$review_count, na.rm = TRUE) + 3 * sd(business$review_count, na.rm = TRUE)
bottom <- mean(business$review_count, na.rm = TRUE) - 3 * sd(business$review_count, na.rm = TRUE)
top  <- floor(top )
bottom <- floor(bottom)
business$review_count[business$review_count < bottom] <- bottom
business$review_count[business$review_count > top] <- top

# Eliminate undifined columns
business <- business[,-3:-4]
business <- business[,-5:-7]
business <- business[,-4]
business <- business[,-5:-20]

# Data Normalize
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}
business$review_count <- normalize(business$review_count)

# Flatten "business$state"
library("nnet")
flatten = as.data.frame(class.ind(business$state))
colnames(flatten) <- paste("state_", colnames(flatten), sep = "")

# append new "business$state", export file
business <- cbind(business, flatten)
business <- business[,-3]
write.table(business,file="C:/Users/richi/Desktop/business_StateReviewcounts.csv",sep=",",row.names=F, na = "NA")




