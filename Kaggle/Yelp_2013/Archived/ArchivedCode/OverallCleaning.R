# Overall 

# yelp recsys 2013_yelp_training_set_review.json===============================================
library(jsonlite)
review_2013 <- stream_in(file("C:/Users/richi/Google_Drive/BDSE10_Project/DataSets/yelp-recsys-2013/yelp_training_set/yelp_training_set/yelp_training_set_review.json"))

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

# Delete "review" column
data_clean1 <- data_clean1[,-8]

# Normalize "Stars" Column
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}
data_clean1$stars <- normalize(data_clean1$stars)

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

# yelp yelp_training_set_review.json===============================================
library(jsonlite)
yelp_review <- stream_in(file("C:/Users/Student/Google 雲端硬碟/BDSE10_Project/DataSets/yelp_dataset/review.json"))

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

write.csv(data_clean1, "C:/Users/Student/Google 雲端硬碟/BDSE10_Project/CleanDataSets/training_review_clean_190513.csv", row.names = FALSE)


# yelp yelp_training_set_tip.json===============================================
library(jsonlite)
yelp_user <- stream_in(file("C:/Users/Student/Google 雲端硬碟/BDSE10_Project/DataSets/yelp_dataset/tip.json"))

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

write.csv(data_clean1, "C:/Users/Student/Google 雲端硬碟/BDSE10_Project/CleanDataSets/yelp_dataset/training_tip_clean_190513.csv", row.names = FALSE)


# yelp ryelp_training_user.json===============================================
library(jsonlite)
yelp <- stream_in(file("C:/Users/Student/Google 雲端硬碟/BDSE10_Project/DataSets/yelp_dataset/user.json"))

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













View(head(data_clean1))

summary(data_clean1$fans)



















# yelp ryelp_training_checkin.json(Unfinished)===============================================
library(jsonlite)
yelp <- stream_in(file("C:/Users/richi/Google_Drive/BDSE10_Project/DataSets/yelp_dataset/checkin.json"))

data_clean1 <- yelp

# Year
library(GetoptLong)
for(y in 2010:2018){
  year000 <- paste("Year_",y)
  data_clean1[qq("@{year000}")] <- NA
  for(i in 1:length(data_clean1$date)){
    # if yes
    if(grepl(y, data_clean1$date[i], ignore.case = FALSE, perl = FALSE, 
             fixed = FALSE, useBytes = FALSE) ){
      # Count Function Start
      temp <-  strsplit(data_clean1[["date"]][i], ',')
      temp0 <- 0
      for(p in 1:length(temp[[1]])){
        if(grepl(y, temp[[1]][p], ignore.case = FALSE, perl = FALSE, 
                 fixed = FALSE, useBytes = FALSE)){temp0 <- temp0 + 1} }
      # Count Function End
     data_clean1[[qq("@{year000}")]][i] <-  temp0
    }else{data_clean1[[qq("@{year000}")]][i] <-  "0"}
  }
}

# Month
library(GetoptLong)
for(y in 1:12){
  month000 <- paste("Month_",y)
  data_clean1[qq("@{month000}")] <- NA
  if(y<10){y <- qq("-0@{y}-")}else{y <- qq("-@{y}-")}
  for(i in 1:length(data_clean1$date)){
    # if yes
    if(grepl(y, data_clean1$date[i], ignore.case = FALSE, perl = FALSE, 
             fixed = FALSE, useBytes = FALSE) ){
      # Count Function Start
      temp <-  strsplit(data_clean1[["date"]][i], ',')
      temp0 <- 0
      for(p in 1:length(temp[[1]])){
        if(grepl(y, temp[[1]][p], ignore.case = FALSE, perl = FALSE, 
                 fixed = FALSE, useBytes = FALSE)){temp0 <- temp0 + 1} }
      # Count Function End
      data_clean1[[qq("@{month000}")]][i] <-  temp0
    }else{data_clean1[[qq("@{month000}")]][i] <-  "0"}
  }
}

# Hour
library(GetoptLong)
for(y in 0:23){
  hour000 <- paste("Hour_",y)
  data_clean1[qq("@{hour000}")] <- NA
  if(y<10){y <- qq(" 0@{y}:")}else{y <- qq(" @{y}:")}
  for(i in 1:length(data_clean1$date)){
    # if yes
    if(grepl(y, data_clean1$date[i], ignore.case = FALSE, perl = FALSE, 
             fixed = FALSE, useBytes = FALSE) ){
      # Count Function Start
      temp <-  strsplit(data_clean1[["date"]][i], ',')
      temp0 <- 0
      for(p in 1:length(temp[[1]])){
        if(grepl(y, temp[[1]][p], ignore.case = FALSE, perl = FALSE, 
                 fixed = FALSE, useBytes = FALSE)){temp0 <- temp0 + 1} }
      # Count Function End
      data_clean1[[qq("@{hour000}")]][i] <-  temp0
    }else{data_clean1[[qq("@{hour000}")]][i] <-  "0"}
  }
}

data_clean1 <- data_clean1[,-2]

write.table(data_clean1,file="C:/Users/richi/Google_Drive/BDSE10_Project/CleanDataSets/yelp_dataset/training_checkin_clean_count_190514.csv",sep=",",row.names=F, na = "NA")

# (Saved)Read CSV ==
yelp <- read.csv("C:/Users/richi/Google_Drive/BDSE10_Project/CleanDataSets/yelp_dataset/training_checkin_clean_count_190514.csv")

data_clean1 <- yelp

# tackle outliers & normalization of Years
library(GetoptLong)
for(y in 2010:2010){
  year000 <- paste("Year_",y,sep="")
  for(i in 1:length(data_clean1[[qq("@{year000}")]])){
    # Tackle Outliers
    top <- mean(data_clean1[[qq("@{year000}")]], na.rm = TRUE) + 3 * sd(data_clean1[[qq("@{year000}")]], na.rm = TRUE)
    bottom <- mean(data_clean1[[qq("@{year000}")]], na.rm = TRUE) - 3 * sd(data_clean1[[qq("@{year000}")]], na.rm = TRUE)
    data_clean1[[qq("@{year000}")]][data_clean1[[qq("@{year000}")]] < bottom] <- bottom
    data_clean1[[qq("@{year000}")]][data_clean1[[qq("@{year000}")]] > top] <- top
    # Normalization
    normalize <- function(x) { 
      return((x - min(x)) / (max(x) - min(x)))
    }
    data_clean1[[qq("@{year000}")]] <- normalize(data_clean1[[qq("@{year000}")]])
  }
}






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


library(GetoptLong)
y <- 2010
year000 <- paste("Year_",y)
data_clean1[[qq("@{year000}")]]



























