# yelp ryelp_training_checkin.json ===============================================
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


# Add Season, timeshift coulumns
yelp <- read.csv("C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp_dataset/training_checkin_clean_count_190514.csv")

data_clean1 <- yelp

data_clean1["spring"] <- NA
data_clean1["summer"] <- NA
data_clean1["autumn"] <- NA
data_clean1["winter"] <- NA
data_clean1["midnight_earlyMorning"] <- NA
data_clean1["morning"] <- NA
data_clean1["afternoon"] <- NA
data_clean1["night"] <- NA


for(i in 1:length(data_clean1$business_id)){
  # Season Simplifying
  data_clean1[['spring']][i] <- data_clean1[['Month_2']][i] + data_clean1[['Month_3']][i] + data_clean1[['Month_4']][i]
  data_clean1[['summer']][i] <- data_clean1[['Month_5']][i] + data_clean1[['Month_6']][i] + data_clean1[['Month_7']][i]
  data_clean1[['autumn']][i] <- data_clean1[['Month_8']][i] + data_clean1[['Month_9']][i] + data_clean1[['Month_10']][i]
  data_clean1[['winter']][i] <- data_clean1[['Month_11']][i] + data_clean1[['Month_12']][i] + data_clean1[['Month_1']][i]
  
  # Hours Simplifying
  data_clean1[["midnight_earlyMorning"]][i] <- data_clean1[['Hour_23']][i] + data_clean1[['Hour_0']][i] + data_clean1[['Hour_1']][i] + data_clean1[['Hour_2']][i] + data_clean1[['Hour_3']][i] + data_clean1[['Hour_4']][i]
  data_clean1[["morning"]][i] <- data_clean1[['Hour_5']][i] + data_clean1[['Hour_6']][i] + data_clean1[['Hour_7']][i] + data_clean1[['Hour_8']][i] + data_clean1[['Hour_9']][i] + data_clean1[['Hour_10']][i]
  data_clean1[["afternoon"]][i] <- data_clean1[['Hour_16']][i] + data_clean1[['Hour_11']][i] + data_clean1[['Hour_12']][i] + data_clean1[['Hour_13']][i] + data_clean1[['Hour_14']][i] + data_clean1[['Hour_15']][i]
  data_clean1[["night"]][i] <- data_clean1[['Hour_17']][i] + data_clean1[['Hour_18']][i] + data_clean1[['Hour_19']][i] + data_clean1[['Hour_20']][i] + data_clean1[['Hour_21']][i] + data_clean1[['Hour_22']][i]
}

write.table(data_clean1,file="C:/Users/Student/Google_Drive/BDSE10_Project/CleanDataSets/yelp_dataset/training_checkin_clean_count_190514.csv",sep=",",row.names=F, na = "NA")



