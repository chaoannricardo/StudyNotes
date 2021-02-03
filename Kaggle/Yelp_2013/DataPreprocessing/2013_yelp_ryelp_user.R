# yelp 2013 ryelp_training_user.json===============================================
library(jsonlite)
yelp <- stream_in(file("C:/Users/Student/Google_Drive/BDSE10_Project/DataSets/yelp-recsys-2013/yelp_training_set/yelp_training_set/yelp_training_set_user.json"))

data_clean1 <- yelp

# tackle outliers of "data_clean1$review_count"
top <- mean(data_clean1$review_count, na.rm = TRUE) + 3 * sd(data_clean1$review_count, na.rm = TRUE)
bottom <- mean(data_clean1$review_count, na.rm = TRUE) - 3 * sd(data_clean1$review_count, na.rm = TRUE)
data_clean1$review_count[data_clean1$review_count < bottom] <- bottom
data_clean1$review_count[data_clean1$review_count > top] <- top

# Normalize "average_stars" Column
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}
data_clean1$average_stars <- normalize(data_clean1$average_stars)

# Produce a new DataFrame:df
library(GetoptLong)
df <- data.frame(Users=c(0))
for(i in 1:43872){
  df <- rbind(df, data.frame(Users=c(0)))
}

df["user_id"] <- data_clean1["user_id"]
df["Users"] <- NULL
df["average_stars"] <- data_clean1["average_stars"]
df["review_count"] <- data_clean1["review_count"]
length(df[["user_id"]]) == length(data_clean1[["user_id"]])

df['funny'] <- data_clean1[["votes"]]["funny"]
df['useful'] <- data_clean1[["votes"]]["useful"]
df['cool'] <- data_clean1[["votes"]]["cool"]

data_clean1 <- df

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

write.table(data_clean1,file="C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/training_user_clean.csv",sep=",",row.names=F, na = "0")


# yelp 2013 ryelp_test_user.json===============================================
library(jsonlite)
yelp <- stream_in(file("C:/Users/Student/Google_Drive/BDSE10_Project/DataSets/yelp-recsys-2013/yelp_test_set/yelp_test_set/yelp_test_set_user.json"))

data_clean1 <- yelp[,-3:-4]

write.table(data_clean1,file="C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/Test_user_clean.csv",sep=",",row.names=F, na = "0")

# yelp 2013 ryelp_finalTest_user.json===============================================
library(jsonlite)
yelp <- stream_in(file("C:/Users/Student/Google_Drive/BDSE10_Project/DataSets/yelp-recsys-2013/final_test_set/final_test_set/final_test_set_user.json"))

data_clean1 <- yelp[,-2]
data_clean1 <- data_clean1[,-3]

write.table(data_clean1,file="C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/finalTest_user_clean.csv",sep=",",row.names=F, na = "0")






