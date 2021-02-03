library(jsonlite)

checkin <- stream_in(file("C:/Users/richi/Google_Drive/BDSE10_Project/DataSets/yelp_dataset/checkin.json"))
checkin_businessID <- checkin$business_id
checkin_date <- checkin$date

table(is.na(checkin_businessID) == FALSE)
table(is.na(checkin$date) == FALSE)
