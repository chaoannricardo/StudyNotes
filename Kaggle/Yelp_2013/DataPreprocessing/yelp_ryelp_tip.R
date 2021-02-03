# yelp yelp_training_set_tip.json===============================================
library(jsonlite)
yelp_user <- stream_in(file("C:/Users/Student/Google ?蝡舐′蝣?/BDSE10_Project/DataSets/yelp_dataset/tip.json"))

data_clean1 <- yelp_user

# tackle outliers of "data_clean1$funny"
top <- mean(data_clean1$compliment_count, na.rm = TRUE) + 3 * sd(data_clean1$compliment_count, na.rm = TRUE)
bottom <- mean(data_clean1$compliment_count, na.rm = TRUE) - 3 * sd(data_clean1$compliment_count, na.rm = TRUE)
data_clean1$compliment_count[data_clean1$compliment_count < bottom] <- bottom
data_clean1$compliment_count[data_clean1$compliment_count > top] <- top


# Normalize "compliment_count" Column
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}
data_clean1$compliment_count <- normalize(data_clean1$compliment_count)

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

# Delete Unused Columns
data_clean1 <- data_clean1[,-3]
data_clean1 <- data_clean1[,-3]

write.csv(data_clean1, "C:/Users/Student/Google ?蝡舐′蝣?/BDSE10_Project/CleanDataSets/yelp_dataset/training_tip_clean_190513.csv", row.names = FALSE)
