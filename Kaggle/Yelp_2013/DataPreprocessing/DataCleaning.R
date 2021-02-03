# yelp yelp_training_set_review.json===============================================
library(jsonlite)
yelp_review <- stream_in(file("C:/Users/Student/Google ?›²ç«¯ç¡¬ç¢?/BDSE10_Project/DataSets/yelp_dataset/review.json"))

data_clean1 <- yelp_review

# Delete "review" column
data_clean1 <- data_clean1[,-8]

# Normalize "stars" Column
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}
data_clean1$stars <- normalize(data_clean1$stars)

# tackle outliers of "data_clean1$useful"
top <- mean(data_clean1$useful, na.rm = TRUE) + 3 * sd(data_clean1$useful, na.rm = TRUE)
bottom <- mean(data_clean1$useful, na.rm = TRUE) - 3 * sd(data_clean1$useful, na.rm = TRUE)
top  <- floor(top)
bottom <- floor(bottom)
data_clean1$useful[data_clean1$useful < bottom] <- bottom
data_clean1$useful[data_clean1$useful > top] <- top
summary(data_clean1$useful)

# Normalize "useful" Column
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}
data_clean1$useful <- normalize(data_clean1$useful)

# tackle outliers of "data_clean1$funny"
top <- mean(data_clean1$funny, na.rm = TRUE) + 3 * sd(data_clean1$funny, na.rm = TRUE)
bottom <- mean(data_clean1$funny, na.rm = TRUE) - 3 * sd(data_clean1$funny, na.rm = TRUE)
top  <- floor(top)
bottom <- floor(bottom)
data_clean1$funny[data_clean1$funny < bottom] <- bottom
data_clean1$funny[data_clean1$funny > top] <- top

# Normalize "funny" Column
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}
data_clean1$funny <- normalize(data_clean1$funny)

# tackle outliers of "data_clean1$cool"
top <- mean(data_clean1$cool, na.rm = TRUE) + 3 * sd(data_clean1$cool, na.rm = TRUE)
bottom <- mean(data_clean1$cool, na.rm = TRUE) - 3 * sd(data_clean1$cool, na.rm = TRUE)
top  <- floor(top)
bottom <- floor(bottom)
data_clean1$cool[data_clean1$cool < bottom] <- bottom
data_clean1$cool[data_clean1$cool > top] <- top

# Normalize "funny" Column
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}
data_clean1$cool <- normalize(data_clean1$cool)

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
data_clean1 <- data_clean1[,-8]
data_clean1 <- data_clean1[,-8]
data_clean1 <- data_clean1[,-8]

# Rearrage Column
data_user_id <- data_clean1[,2]
data_review_id <- data_clean1[,1]
data_business_id <- data_clean1[,3]
data_clean1 <- cbind(data_review_id, data_clean1)
data_clean1 <- cbind(data_user_id, data_clean1)
data_clean1 <- cbind(data_business_id, data_clean1)

# Delete Unused Columns
data_clean1 <- data_clean1[,-4]
data_clean1 <- data_clean1[,-4]
data_clean1 <- data_clean1[,-4]

write.csv(data_clean1, "C:/Users/Student/Google ?›²ç«¯ç¡¬ç¢?/BDSE10_Project/CleanDataSets/training_review_clean_190513.csv", row.names = FALSE)


# yelp yelp_training_set_tip.json===============================================
library(jsonlite)
yelp_user <- stream_in(file("C:/Users/Student/Google ?›²ç«¯ç¡¬ç¢?/BDSE10_Project/DataSets/yelp_dataset/tip.json"))

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

write.csv(data_clean1, "C:/Users/Student/Google ?›²ç«¯ç¡¬ç¢?/BDSE10_Project/CleanDataSets/yelp_dataset/training_tip_clean_190513.csv", row.names = FALSE)


# yelp ryelp_training_checkin.json(Unfinished)===============================================
library(jsonlite)
yelp <- stream_in(file("C:/Users/Student/Google ?›²ç«¯ç¡¬ç¢?/BDSE10_Project/DataSets/yelp_dataset/user.json"))

data_clean1 <- yelp

# tackle outliers of "data_clean1$review_count"
top <- mean(data_clean1$review_count, na.rm = TRUE) + 3 * sd(data_clean1$review_count, na.rm = TRUE)
bottom <- mean(data_clean1$review_count, na.rm = TRUE) - 3 * sd(data_clean1$review_count, na.rm = TRUE)
data_clean1$review_count[data_clean1$review_count < bottom] <- bottom
data_clean1$review_count[data_clean1$review_count > top] <- top

# Normalize "review_count" Column
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}
data_clean1$review_count <- normalize(data_clean1$review_count)


# tackle outliers of "data_clean1$useful"
top <- mean(data_clean1$useful, na.rm = TRUE) + 3 * sd(data_clean1$useful, na.rm = TRUE)
bottom <- mean(data_clean1$useful, na.rm = TRUE) - 3 * sd(data_clean1$useful, na.rm = TRUE)
data_clean1$useful[data_clean1$useful < bottom] <- bottom
data_clean1$useful[data_clean1$useful > top] <- top

# Normalize "useful" Column
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}
data_clean1$useful <- normalize(data_clean1$useful)

# tackle outliers of "data_clean1$funny"
top <- mean(data_clean1$funny, na.rm = TRUE) + 3 * sd(data_clean1$funny, na.rm = TRUE)
bottom <- mean(data_clean1$funny, na.rm = TRUE) - 3 * sd(data_clean1$funny, na.rm = TRUE)
data_clean1$funny[data_clean1$funny < bottom] <- bottom
data_clean1$funny[data_clean1$funny > top] <- top

# Normalize "funny" Column
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}
data_clean1$funny <- normalize(data_clean1$funny)

# tackle outliers of "data_clean1$cool"
top <- mean(data_clean1$cool, na.rm = TRUE) + 3 * sd(data_clean1$cool, na.rm = TRUE)
bottom <- mean(data_clean1$cool, na.rm = TRUE) - 3 * sd(data_clean1$cool, na.rm = TRUE)
data_clean1$cool[data_clean1$cool < bottom] <- bottom
data_clean1$cool[data_clean1$cool > top] <- top

# Normalize "cool" Column
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}
data_clean1$cool <- normalize(data_clean1$cool)

# tackle outliers of "data_clean1$fans"
top <- mean(data_clean1$fans, na.rm = TRUE) + 3 * sd(data_clean1$fans, na.rm = TRUE)
bottom <- mean(data_clean1$fans, na.rm = TRUE) - 3 * sd(data_clean1$fans, na.rm = TRUE)
data_clean1$fans[data_clean1$fans < bottom] <- bottom
data_clean1$fans[data_clean1$fans > top] <- top

summary(data_clean1$fans)

# Normalize "fans" Column
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}
data_clean1$fans <- normalize(data_clean1$fans)


# Normalize "average_stars" Column
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}
data_clean1$average_stars <- normalize(data_clean1$average_stars)

# tackle outliers of "data_clean1$compliment_hot"
top <- mean(data_clean1$fans, na.rm = TRUE) + 3 * sd(data_clean1$fans, na.rm = TRUE)
bottom <- mean(data_clean1$fans, na.rm = TRUE) - 3 * sd(data_clean1$fans, na.rm = TRUE)
data_clean1$fans[data_clean1$fans < bottom] <- bottom
data_clean1$fans[data_clean1$fans > top] <- top

summary(data_clean1$fans)

# Normalize "fans" Column
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}
data_clean1$fans <- normalize(data_clean1$fans)
