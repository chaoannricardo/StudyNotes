# yelp yelp_training_set_review.json===============================================
library(jsonlite)
review_2013 <- stream_in(file("C:/Users/Student/Google_Drive/BDSE10_Project/DataSets/yelp-recsys-2013/yelp_training_set/yelp_training_set/yelp_training_set_review.json"))

data.c <- review_2013[,c("votes")]
funny <- data.c[,1]
useful <- data.c[,2]
cool <- data.c[,3]
data.n <- c(funny + useful + cool)
funny <- (data.c[,1] / data.n)
useful <- (data.c[,2] / data.n)
cool <- (data.c[,3] / data.n)
data.c <- as.data.frame(cbind(funny, useful, cool))
data.c[is.na(data.c)] <- 0
data.k <-review_2013[,-c(1,ncol(data))] 
data_clean1 <- cbind(data.c, data.k)

# Delete "text" column
data_clean1 <- data_clean1[,-8]

# Delete  "type" column
data_clean1 <- data_clean1[,-8]

# Extract "Year' & "Month"
library(data.table)
setDT(data_clean1)[, Year := format(as.Date(data_clean1$date), "%Y") ]
setDT(data_clean1)[, Month := format(as.Date(data_clean1$date), "%m") ]

# Flatten "Year" & "Month"
library("nnet")
flatten = as.data.frame(class.ind(data_clean1$Year))
colnames(flatten) <- paste("Year-", colnames(flatten), sep = "")
data_clean1 <- cbind(data_clean1, flatten)
flatten = as.data.frame(class.ind(data_clean1$Month))
colnames(flatten) <- paste("Month-", colnames(flatten), sep = "")
data_clean1 <- cbind(data_clean1, flatten)

# Delete "date"
data_clean1 <- data_clean1[,-7]
data_clean1 <- data_clean1[,-8]
data_clean1 <- data_clean1[,-8]

# Rearrage Column
data_user_id <- data_clean1[,4]
data_review_id <- data_clean1[,5]
data_business_id <- data_clean1[,7]
data_clean1 <- cbind(data_review_id, data_clean1)
data_clean1 <- cbind(data_user_id, data_clean1)
data_clean1 <- cbind(data_business_id, data_clean1)

# Delete Unused Columns
data_clean1 <- data_clean1[,-7]
data_clean1 <- data_clean1[,-7]
data_clean1 <- data_clean1[,-8]

write.csv(data_clean1, "C:/Users/richi/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/training_review_clean_190513.csv", row.names = FALSE)


# yelp yelp_test_set_review.json===============================================
library(jsonlite)
review_2013 <- stream_in(file("C:/Users/Student/Google_Drive/BDSE10_Project/DataSets/yelp-recsys-2013/yelp_test_set/yelp_test_set/yelp_test_set_review.json"))
data_clean1 <- review_2013
write.csv(data_clean1, "C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/Test_review_clean.csv", row.names = FALSE)

# yelp yelp_finaltest_set_review.json===============================================
library(jsonlite)
review_2013 <- stream_in(file("C:/Users/Student/Google_Drive/BDSE10_Project/DataSets/yelp-recsys-2013/final_test_set/final_test_set/final_test_set_review.json"))
data_clean1 <- review_2013
write.csv(data_clean1, "C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/finalTest_review_clean.csv", row.names = FALSE)

