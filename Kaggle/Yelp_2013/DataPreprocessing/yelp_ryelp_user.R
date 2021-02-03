# yelp ryelp_training_user.json===============================================
library(jsonlite)
yelp <- stream_in(file("C:/Users/Student/Google ?蝡舐′蝣?/BDSE10_Project/DataSets/yelp_dataset/user.json"))

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