# yelp ryelp_training_checkin.json ===============================================
library(jsonlite)
yelp <- stream_in(file("C:/Users/Student/Google_Drive/BDSE10_Project/DataSets/yelp-recsys-2013/yelp_training_set/yelp_training_set/yelp_training_set_checkin.json"))

data_clean1 <- yelp

# Produce a new DataFrame:df
library(GetoptLong)
df <- data.frame(Users=c(0))
for(i in 1:8281){
  df <- rbind(df, data.frame(Users=c(0)))
}

length(df[["business_id"]]) == length(data_clean1[["business_id"]])

df["business_id"] <- data_clean1["business_id"]
df["Users"] <- NULL
df["type"] <- data_clean1["type"]

# append and compute value of each weekday
for(a in 0:6){
  week111 <- paste("-" ,a , sep = "")
  week222 <- paste("week_", a, sep="")
  df[qq("@{week222}")] <- NA
  weekAAA <- paste("_" ,a , sep = "")
  for(i in 0:23){
    week000 <- paste(i, week111, sep = "")
    weekBBB <- paste(i, weekAAA, sep = "")
    df[qq("@{weekBBB}")] <- data_clean1[["checkin_info"]][qq("@{week000}")]
    for(j in 1:8281){
      df[[qq("@{week222}")]][j] <-  sum(df[[qq("@{week222}")]][j], df[[qq("@{weekBBB}")]][j], na.rm=TRUE)
    }
  }
}


write.table(df,file="C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/training_checkin_clean_count.csv",sep=",",row.names=F, na = "0")

# =======check point=========

yelp <- read.csv("C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/training_checkin_clean_count.csv")

df <- yelp

View(head(df))

# append and compute value of each weekday

for(a in 0:23){
  hour111 <- paste("X", a, "_", sep = "")
  hour222 <- paste("Hour_", a, sep="")
  df[qq("@{hour222}")] <- NA
  weekAAA <- paste("_" ,a , sep = "")
  for(i in 0:6){
    hour000 <- paste(hour111, i, sep = "")
    for(j in 1:8281){
      df[[qq("@{hour222}")]][j] <-  sum(df[[qq("@{hour222}")]][j], df[[qq("@{hour000}")]][j], na.rm=TRUE)
    }
  }
}

write.table(df,file="C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/training_checkin_clean_count.csv",sep=",",row.names=F, na = "0")

# =======check point=========
# midnight_earlyMorning, morning, afternoon, night

yelp <- read.csv("C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/training_checkin_clean_count.csv")

data_clean1 <- yelp

data_clean1["midnight_earlyMorning"] <- NA
data_clean1["morning"] <- NA
data_clean1["afternoon"] <- NA
data_clean1["night"] <- NA

for(i in 1:length(data_clean1$business_id)){
  # Hours Simplifying
  data_clean1[["midnight_earlyMorning"]][i] <- data_clean1[['Hour_23']][i] + data_clean1[['Hour_0']][i] + data_clean1[['Hour_1']][i] + data_clean1[['Hour_2']][i] + data_clean1[['Hour_3']][i] + data_clean1[['Hour_4']][i]
  data_clean1[["morning"]][i] <- data_clean1[['Hour_5']][i] + data_clean1[['Hour_6']][i] + data_clean1[['Hour_7']][i] + data_clean1[['Hour_8']][i] + data_clean1[['Hour_9']][i] + data_clean1[['Hour_10']][i]
  data_clean1[["afternoon"]][i] <- data_clean1[['Hour_16']][i] + data_clean1[['Hour_11']][i] + data_clean1[['Hour_12']][i] + data_clean1[['Hour_13']][i] + data_clean1[['Hour_14']][i] + data_clean1[['Hour_15']][i]
  data_clean1[["night"]][i] <- data_clean1[['Hour_17']][i] + data_clean1[['Hour_18']][i] + data_clean1[['Hour_19']][i] + data_clean1[['Hour_20']][i] + data_clean1[['Hour_21']][i] + data_clean1[['Hour_22']][i]
}

write.table(data_clean1,file="C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/training_checkin_clean_count.csv",sep=",",row.names=F, na = "0")


# =======check point=========
# weekdays, weekends

yelp <- read.csv("C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/training_checkin_clean_count.csv")

data_clean1 <- yelp

data_clean1["weekdays"] <- NA
data_clean1["weekend"] <- NA

for(i in 1:length(data_clean1$business_id)){
  # weekdays Simplifying
  data_clean1[["weekdays"]][i] <- data_clean1[['week_1']][i] + data_clean1[['week_2']][i] + data_clean1[['week_3']][i] + data_clean1[['week_4']][i] + data_clean1[['week_5']][i]
  data_clean1[["weekends"]][i] <- data_clean1[['week_0']][i] + data_clean1[['week_6']][i]
 }


write.table(data_clean1,file="C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/training_checkin_clean_count.csv",sep=",",row.names=F, na = "0")



# ==================================================================================
# ==================================================================================
# yelp ryelp_final_test_checkin.json ===============================================
library(jsonlite)
yelp <- stream_in(file("C:/Users/Student/Google_Drive/BDSE10_Project/DataSets/yelp-recsys-2013/final_test_set/final_test_set/final_test_set_checkin.json"))

data_clean1 <- yelp

# Produce a new DataFrame:df
library(GetoptLong)
df <- data.frame(Users=c(0))
for(i in 1:1795){
  df <- rbind(df, data.frame(Users=c(0)))
}

df["business_id"] <- data_clean1["business_id"]
df["Users"] <- NULL
df["type"] <- data_clean1["type"]

# append and compute value of each weekday
for(a in 0:6){
  week111 <- paste("-" ,a , sep = "")
  week222 <- paste("week_", a, sep="")
  df[qq("@{week222}")] <- NA
  weekAAA <- paste("_" ,a , sep = "")
  for(i in 0:23){
    week000 <- paste(i, week111, sep = "")
    weekBBB <- paste(i, weekAAA, sep = "")
    df[qq("@{weekBBB}")] <- data_clean1[["checkin_info"]][qq("@{week000}")]
    for(j in 1:1796){
      df[[qq("@{week222}")]][j] <-  sum(df[[qq("@{week222}")]][j], df[[qq("@{weekBBB}")]][j], na.rm=TRUE)
    }
  }
}

write.table(df,file="C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/finalTest_checkin_clean_count.csv",sep=",",row.names=F, na = "0")


# =======check point=========

yelp <- read.csv("C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/finalTest_checkin_clean_count.csv")

df <- yelp

# append and compute value of each hour

for(a in 0:23){
  hour111 <- paste("X", a, "_", sep = "")
  hour222 <- paste("Hour_", a, sep="")
  df[qq("@{hour222}")] <- NA
  weekAAA <- paste("_" ,a , sep = "")
  for(i in 0:6){
    hour000 <- paste(hour111, i, sep = "")
    for(j in 1:1796){
      df[[qq("@{hour222}")]][j] <-  sum(df[[qq("@{hour222}")]][j], df[[qq("@{hour000}")]][j], na.rm=TRUE)
    }
  }
}

write.table(df,file="C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/finalTest_checkin_clean_count.csv",sep=",",row.names=F, na = "0")

# =======check point=========
# midnight_earlyMorning, morning, afternoon, night

yelp <- read.csv("C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/finalTest_checkin_clean_count.csv")

data_clean1 <- yelp

data_clean1["midnight_earlyMorning"] <- NA
data_clean1["morning"] <- NA
data_clean1["afternoon"] <- NA
data_clean1["night"] <- NA

for(i in 1:length(data_clean1$business_id)){
  # Hours Simplifying
  data_clean1[["midnight_earlyMorning"]][i] <- data_clean1[['Hour_23']][i] + data_clean1[['Hour_0']][i] + data_clean1[['Hour_1']][i] + data_clean1[['Hour_2']][i] + data_clean1[['Hour_3']][i] + data_clean1[['Hour_4']][i]
  data_clean1[["morning"]][i] <- data_clean1[['Hour_5']][i] + data_clean1[['Hour_6']][i] + data_clean1[['Hour_7']][i] + data_clean1[['Hour_8']][i] + data_clean1[['Hour_9']][i] + data_clean1[['Hour_10']][i]
  data_clean1[["afternoon"]][i] <- data_clean1[['Hour_16']][i] + data_clean1[['Hour_11']][i] + data_clean1[['Hour_12']][i] + data_clean1[['Hour_13']][i] + data_clean1[['Hour_14']][i] + data_clean1[['Hour_15']][i]
  data_clean1[["night"]][i] <- data_clean1[['Hour_17']][i] + data_clean1[['Hour_18']][i] + data_clean1[['Hour_19']][i] + data_clean1[['Hour_20']][i] + data_clean1[['Hour_21']][i] + data_clean1[['Hour_22']][i]
}

write.table(data_clean1,file="C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/finalTest_checkin_clean_count.csv",sep=",",row.names=F, na = "0")

# =======check point=========
# weekdays, weekend

yelp <- read.csv("C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/finalTest_checkin_clean_count.csv")

data_clean1 <- yelp

data_clean1["weekdays"] <- NA
data_clean1["weekend"] <- NA

for(i in 1:length(data_clean1$business_id)){
  # weekdays Simplifying
  data_clean1[["weekdays"]][i] <- data_clean1[['week_1']][i] + data_clean1[['week_2']][i] + data_clean1[['week_3']][i] + data_clean1[['week_4']][i] + data_clean1[['week_5']][i]
  data_clean1[["weekends"]][i] <- data_clean1[['week_0']][i] + data_clean1[['week_6']][i]
}

write.table(data_clean1,file="C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/finalTest_checkin_clean_count.csv",sep=",",row.names=F, na = "0")

# ==================================================================================
# ==================================================================================
# yelp ryelp_final_test_checkin.json ===============================================
library(jsonlite)
yelp <- stream_in(file("C:/Users/Student/Google_Drive/BDSE10_Project/DataSets/yelp-recsys-2013/yelp_test_set/yelp_test_set/yelp_test_set_checkin.json"))

data_clean1 <- yelp


# Produce a new DataFrame:df
library(GetoptLong)
df <- data.frame(Users=c(0))
for(i in 1:733){
  df <- rbind(df, data.frame(Users=c(0)))
}

df["business_id"] <- data_clean1["business_id"]
df["Users"] <- NULL
df["type"] <- data_clean1["type"]

# append and compute value of each weekday
for(a in 0:6){
  week111 <- paste("-" ,a , sep = "")
  week222 <- paste("week_", a, sep="")
  df[qq("@{week222}")] <- NA
  weekAAA <- paste("_" ,a , sep = "")
  for(i in 0:23){
    week000 <- paste(i, week111, sep = "")
    weekBBB <- paste(i, weekAAA, sep = "")
    df[qq("@{weekBBB}")] <- data_clean1[["checkin_info"]][qq("@{week000}")]
    for(j in 1:734){
      df[[qq("@{week222}")]][j] <-  sum(df[[qq("@{week222}")]][j], df[[qq("@{weekBBB}")]][j], na.rm=TRUE)
    }
  }
}

write.table(df,file="C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/Test_checkin_clean_count.csv",sep=",",row.names=F, na = "0")


# =======check point=========

yelp <- read.csv("C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/Test_checkin_clean_count.csv")

df <- yelp

# append and compute value of each hour

for(a in 0:23){
  hour111 <- paste("X", a, "_", sep = "")
  hour222 <- paste("Hour_", a, sep="")
  df[qq("@{hour222}")] <- NA
  weekAAA <- paste("_" ,a , sep = "")
  for(i in 0:6){
    hour000 <- paste(hour111, i, sep = "")
    for(j in 1:734){
      df[[qq("@{hour222}")]][j] <-  sum(df[[qq("@{hour222}")]][j], df[[qq("@{hour000}")]][j], na.rm=TRUE)
    }
  }
}

write.table(df,file="C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/Test_checkin_clean_count.csv",sep=",",row.names=F, na = "0")

# =======check point=========
# midnight_earlyMorning, morning, afternoon, night

yelp <- read.csv("C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/Test_checkin_clean_count.csv")

data_clean1 <- yelp

data_clean1["midnight_earlyMorning"] <- NA
data_clean1["morning"] <- NA
data_clean1["afternoon"] <- NA
data_clean1["night"] <- NA

for(i in 1:length(data_clean1$business_id)){
  # Hours Simplifying
  data_clean1[["midnight_earlyMorning"]][i] <- data_clean1[['Hour_23']][i] + data_clean1[['Hour_0']][i] + data_clean1[['Hour_1']][i] + data_clean1[['Hour_2']][i] + data_clean1[['Hour_3']][i] + data_clean1[['Hour_4']][i]
  data_clean1[["morning"]][i] <- data_clean1[['Hour_5']][i] + data_clean1[['Hour_6']][i] + data_clean1[['Hour_7']][i] + data_clean1[['Hour_8']][i] + data_clean1[['Hour_9']][i] + data_clean1[['Hour_10']][i]
  data_clean1[["afternoon"]][i] <- data_clean1[['Hour_16']][i] + data_clean1[['Hour_11']][i] + data_clean1[['Hour_12']][i] + data_clean1[['Hour_13']][i] + data_clean1[['Hour_14']][i] + data_clean1[['Hour_15']][i]
  data_clean1[["night"]][i] <- data_clean1[['Hour_17']][i] + data_clean1[['Hour_18']][i] + data_clean1[['Hour_19']][i] + data_clean1[['Hour_20']][i] + data_clean1[['Hour_21']][i] + data_clean1[['Hour_22']][i]
}

write.table(data_clean1,file="C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/Test_checkin_clean_count.csv",sep=",",row.names=F, na = "0")

# =======check point=========
# weekdays, weekend

yelp <- read.csv("C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/Test_checkin_clean_count.csv")

data_clean1 <- yelp

data_clean1["weekdays"] <- NA

for(i in 1:length(data_clean1$business_id)){
  # weekdays Simplifying
  data_clean1[["weekdays"]][i] <- data_clean1[['week_1']][i] + data_clean1[['week_2']][i] + data_clean1[['week_3']][i] + data_clean1[['week_4']][i] + data_clean1[['week_5']][i]
  data_clean1[["weekends"]][i] <- data_clean1[['week_0']][i] + data_clean1[['week_6']][i]
}

write.table(data_clean1,file="C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp-recsys-2013/Test_checkin_clean_count.csv",sep=",",row.names=F, na = "0")






